--This question asks: Get the students who's average time it takes to complete 
--an assignment is less than the average estimated time it takes to complete an assignment.

--I think this is the same as other question only we have to apply a halving to it, and this condition
--will check if the average student completion time is lower than the overall average completion for this assignment in general. 
--This means we must target assignments duration as well. 

SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration, AVG(assignments.duration) as average_estimated_completiontime

FROM students JOIN assignment_submissions ON students.id = student_id JOIN assignments ON assignment_submissions.assignment_id = assignments.id

WHERE end_date IS NULL

GROUP BY students.name

HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)

ORDER BY average_assignment_duration;