
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

