
/*Select total lessons*/

SELECT DISTINCT month,
SUM(COUNT)
OVER (PARTITION BY month) AS total_monthly_Lessons
FROM(
    SELECT COUNT(id), month 
    FROM lesson
    GROUP BY month
    UNION
    SELECT COUNT(id), month 
    FROM ensemble
    GROUP BY month
) AS f;

/* 
 month | monthlylessons 
-------+----------------
 01    |              9
 02    |              4
 03    |              1
 07    |              1
 08    |              1 
 */




/* Lists group, individual and ensembles */ 

SELECT month, COUNT(DISTINCT gid) AS group_lessons, 
COUNT(DISTINCT iid) AS individual_lessons, COUNT (DISTINCT eid) AS ensembles
FROM 
(
SELECT group_lesson.lesson_id AS gid, individual_lesson.lesson_id AS iid, ensemble.id AS eid, lesson.month
FROM lesson
FULL OUTER JOIN individual_lesson
ON lesson.id = individual_lesson.lesson_id
FULL OUTER JOIN group_lesson
ON lesson.id = group_lesson.lesson_id
FULL OUTER JOIN ensemble
ON ensemble.month = lesson.month
) as f
GROUP BY month
ORDER BY month;

 /* 
 month | group_lessons | individual_lessons | ensembles 
-------+---------------+--------------------+-----------
 01    |             3 |                  6 |         3
 02    |             3 |                  0 |         1
 07    |             1 |                  0 |         0
 08    |             1 |                  0 |         0
       |             0 |                  0 |         1 
*/
 

 /* See how many siblings each student has*/

SELECT DISTINCT student.id AS student , COUNT(sibling.student_id) AS siblings
FROM student, sibling
WHERE student.person_id = sibling.person_id
GROUP BY student
ORDER BY student;

/* 
 student | siblings 
---------+----------
   21111 |        1
   21112 |        1
   21119 |        2
   21120 |        2
   21121 |        2 
*/



/* See which the siblings actually are */

SELECT student.id AS student , sibling.person_id AS sibling
FROM student, sibling
WHERE student.person_id = sibling.person_id
ORDER BY student;


/*
 student | sibling 
---------+---------
   21111 |   11111
   21112 |   11112
   21119 |   11119
   21119 |   11119
   21120 |   11120
   21120 |   11120
   21121 |   11121
   21121 |   11121 
*/



/* Show amount of lessons per instructor, inner query gives all booked lessons once */


SELECT * 
FROM(
SELECT DISTINCT id AS instructor, 
COUNT(lesson_id)
OVER (PARTITION BY id) AS amount_of_lessons, month
FROM
(
SELECT DISTINCT booked_individual_lesson.lesson_id, instructor.id, lesson.month
FROM instructor
INNER JOIN booked_individual_lesson
On instructor.id = booked_individual_lesson.instructor_id
INNER JOIN lesson
ON lesson.id = booked_individual_lesson.lesson_id
UNION
SELECT DISTINCT scheduled_group_lesson.lesson_id, instructor.id, lesson.month
FROM instructor 
INNER JOIN scheduled_group_lesson
ON instructor.id = scheduled_group_lesson.instructor_id
INNER JOIN lesson
ON lesson.id = scheduled_group_lesson.lesson_id
UNION
SELECT DISTINCT scheduled_ensemble.ensemble_id, instructor.id, ensemble.month
FROM instructor
INNER JOIN scheduled_ensemble 
ON instructor.id = scheduled_ensemble.instructor_id
INNER JOIN ensemble
ON ensemble.id = scheduled_ensemble.ensemble_id
) 
AS f
WHERE CAST(month AS INT) = (date_part('month',CURRENT_DATE))
ORDER BY instructor
) as g
WHERE (amount_of_lessons > 1);


/*Month can be changed to an int for testing */

/* 

 instructor | amount_of_lessons | month 
------------+-------------------+-------
      91901 |                 1 | 01
      91902 |                 2 | 01
      91903 |                 1 | 01
      91904 |                 3 | 01
      91905 |                 2 | 01
      91906 |                 2 | 01     
      


Current month with limit set to 1 below

instructor | amount_of_lessons | month 
------------+-------------------+-------
      91902 |                 2 | 12     
*/



SELECT id AS lesson_id, 
CASE 
WHEN places_left > 2 THEN 'Many seats left'
WHEN places_left > 0 THEN '1-2 seats left'
ELSE 'No seats left'
END AS places_left, genre, schedule, day , month
FROM (
SELECT DISTINCT id, 
(max-(COUNT(student_attending) OVER (PARTITION BY id))) AS places_left,
max, genre, schedule,
COUNT(student_attending) OVER (PARTITION BY id) AS students_attending,
day, month  
FROM 
(
SELECT ensemble.id, student_id AS student_attending, CAST(ensemble.max_students AS INT) AS max, 
ensemble.day, ensemble.month, genre, schedule
FROM ensemble 
FULL OUTER JOIN  scheduled_ensemble
ON ensemble.id = scheduled_ensemble.ensemble_id
JOIN genre
ON ensemble.genre_id = genre.id
WHERE CAST(day AS INT) BETWEEN date_part('day',CURRENT_DATE)
AND  date_part('day',CURRENT_DATE+6)
AND CAST(month AS INT) = date_part('month',CURRENT_DATE)
AND CAST(YEAR AS INT)  = date_part('year',CURRENT_DATE)
ORDER BY genre_id, day
) as f
) as g;


/*
Final result 
 lesson_id |   places_left   |  genre  | schedule | day | month
-----------+-----------------+---------+----------+-----+-------
     22006 | 1-2 seats left  | RnB     | Friday   | 02  | 12
     22007 | Many seats left | RnB     | Monday   | 05  | 12
     22008 | Many seats left | Grunge  | Tuesday  | 06  | 12
     22009 | Many seats left | Hip-Hop | Tuesday  | 06  | 12

Middle subquery

  id   | places_left | max |  genre  | schedule | students_attending | day | month
-------+-------------+-----+---------+----------+--------------------+-----+-------
 22006 |           2 |   4 | RnB     | Friday   |                  2 | 02  | 12
 22007 |           3 |   4 | RnB     | Monday   |                  1 | 05  | 12
 22008 |           5 |   5 | Grunge  | Tuesday  |                  0 | 06  | 12
 22009 |           3 |   3 | Hip-Hop | Tuesday  |                  0 | 06  | 12


*/




