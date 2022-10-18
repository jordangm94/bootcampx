SELECT day, COUNT(name)
FROM assignments
GROUP BY assignments.day
ORDER BY day;