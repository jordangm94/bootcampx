SELECT name, SUM(duration)
FROM assignment_submissions a_sub JOIN students sd ON a_sub.student_id = sd.id
WHERE sd.name LIKE 'Ibrahim Schimmel';