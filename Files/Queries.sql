
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

/* month | monthlylessons 
-------+----------------
 01    |              9
 02    |              4
 03    |              1
 07    |              1
 08    |              1 */



/*list group and individual lessons*/

SELECT month, COUNT(gid) AS group_lessons, COUNT(iid) AS individual_lessons
FROM 
(
SELECT group_lesson.lesson_id AS gid, individual_lesson.lesson_id AS iid
FROM individual_lesson
FULL OUTER JOIN group_lesson
ON individual_lesson.lesson_id = group_lesson.lesson_id
) as f
JOIN lesson
ON lesson.id = iid 
OR lesson.id = gid
GROUP BY month
ORDER BY month;

/* month | group_lessons | individual_lessons 
-------+---------------+--------------------
 01    |             3 |                  3
 02    |             3 |                  0
 07    |             1 |                  0
 08    |             1 |                  0 */



/* Lists group, individual and ensembles, broken due to ensembles using own months */ 

SELECT month, COUNT(gid) AS group_lessons, COUNT(iid) AS individual_lessons, COUNT (eid) AS ensembles
FROM 
(
SELECT group_lesson.lesson_id AS gid, individual_lesson.lesson_id AS iid, ensemble.id AS eid
FROM individual_lesson
JOIN lesson
ON lesson.id = iid 
FULL OUTER JOIN group_lesson
ON individual_lesson.lesson_id = group_lesson.lesson_id
JOIN lesson
ON lesson.id = gid 
FULL OUTER JOIN ensemble
ON ensemble.month = individual_lesson.month
) as f

OR lesson.id = gid
GROUP BY month
ORDER BY month;

/* month | group_lessons | individual_lessons | ensembles 
-------+---------------+--------------------+-----------
 01    |             3 |                  3 |         0
 02    |             3 |                  0 |         0
 07    |             1 |                  0 |         0
 08    |             1 |                  0 |         0 */



/* Only ensemble since they dont show up in the other one */

SELECT DISTINCT month,
SUM(COUNT)
OVER (PARTITION BY month) AS monthlyLessons
FROM(
    SELECT COUNT(id), month 
    FROM ensemble
    GROUP BY month
    ORDER BY month
) AS f;

/* month | monthlylessons 
-------+----------------
 02    |              1
 03    |              1
 01    |              3 */
 


 /* See how many siblings each student has*/

SELECT DISTINCT student.id AS student , COUNT(sibling.student_id) AS siblings
FROM student, sibling
WHERE student.person_id = sibling.person_id
GROUP BY student
ORDER BY student;

/* student | siblings 
---------+----------
   21111 |        1
   21112 |        1
   21119 |        2
   21120 |        2
   21121 |        2 */



/* See which the siblings actually are */

SELECT student.id AS student , sibling.person_id AS sibling
FROM student, sibling
WHERE student.person_id = sibling.person_id
ORDER BY student;


/* student | sibling 
---------+---------
   21111 |   11111
   21112 |   11112
   21119 |   11119
   21119 |   11119
   21120 |   11120
   21120 |   11120
   21121 |   11121
   21121 |   11121 */



/* Show amount of lessons per instructor, inner query gives all booked lessons once */

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
WHERE month = '01'
ORDER BY instructor;

/* instructor | amount_of_lessons | month 
------------+-------------------+-------
      91901 |                 1 | 01
      91902 |                 2 | 01
      91903 |                 1 | 01
      91904 |                 3 | 01
      91905 |                 2 | 01
      91906 |                 2 | 01     */

