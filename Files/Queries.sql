
/*Select total lessons*/

SELECT DISTINCT month,
SUM(COUNT)
OVER (PARTITION BY month) AS monthlyLessons
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

/* Lists group, individual and ensembles, broken due to ensembles using own months */ 

SELECT month, COUNT(gid) AS group_lessons, COUNT(iid) AS individual_lessons, COUNT (eid) AS ensembles
FROM 
(
SELECT group_lesson.lesson_id AS gid, individual_lesson.lesson_id AS iid, ensemble.id AS eid
FROM individual_lesson
FULL OUTER JOIN group_lesson
ON individual_lesson.lesson_id = group_lesson.lesson_id
FULL OUTER JOIN ensemble
ON ensemble.id = individual_lesson.lesson_id
) as f
JOIN lesson
ON lesson.id = iid 
OR lesson.id = gid
GROUP BY month
ORDER BY month;

/* month | group_lessons | individual_lessons | ensembles 
-------+---------------+--------------------+-----------
 01    |             3 |                  3 |         0
 02    |             3 |                  0 |         0
 07    |             1 |                  0 |         0
 08    |             1 |                  0 |         0 */



