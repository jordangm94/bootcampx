SELECT name, email, phone

FROM students
--We use is almsot as an if statement, it checks for a boolean.
-- IS will always check if this statement is truthy.
-- If we wanted to search for something specifically though,
-- I.e. like name = 'Jordan', than we would use LIKE
WHERE github IS NULL

--Here we need to make end_date not null, to exclude students who currently enrolled as we are
--Only looking for graduates. 
AND end_date IS NOT NULL;