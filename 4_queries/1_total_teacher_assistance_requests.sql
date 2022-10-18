SELECT name, COUNT(created_at) as completed_requests
FROM teachers JOIN assistance_requests ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY name;