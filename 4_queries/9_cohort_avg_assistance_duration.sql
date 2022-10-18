-- We also need to know the average total amount of time being spent on an 
-- assistance request for each cohort. This is just the average of the total_duration column from the previous query.

--SO here we use an aggregate function of AVG on total_duration as we want the average of all of these
--We ensure we give it an alias
SELECT AVG(total_duration) as average_total_duration
--Now we reference all our past work which got the list of total durations per cohort using this FROM
FROM (SELECT cohorts.name as cohort, SUM(completed_at - started_at) as total_duration

FROM assistance_requests JOIN students ON student_id=students.id

JOIN cohorts ON cohort_id=cohorts.id

GROUP BY cohorts.name
--At the end here we must give out sub FROM an ALIAS. 
ORDER BY total_duration) as total_durations;