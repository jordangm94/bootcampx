SELECT name as student_name, COUNT(created_at) as total_assistance_requests

FROM students JOIN assistance_requests ON students.id = student_id

WHERE name = 'Elliot Dickinson'

GROUP BY name;