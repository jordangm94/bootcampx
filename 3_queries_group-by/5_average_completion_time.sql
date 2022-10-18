SELECT students.name as student, AVG(assignment_submissions.duration) as average_time_from_submissions

FROM students JOIN assignment_submissions ON students.id = student_id

--Note WHERE will come before the GROUP BY as you want to specify this BEFORE you apply aggregate function to students.name
--Note you can just simply list end_date here, you don't need to put students.end_date
WHERE end_date IS NULL

GROUP BY students.name

ORDER BY average_time_from_submissions DESC;