SELECT day, COUNT(name)
FROM assignments
GROUP BY assignments.day
HAVING COUNT(assignments.name) >= 10
ORDER BY day;