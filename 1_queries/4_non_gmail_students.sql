SELECT name, email, id, cohort_id

FROM students
--This is informing us that email does not have a particualr characteristic, in this case ends with gmail.com
--The %gmail.com means that the email ends with GMAIL.com
WHERE email NOT LIKE '%gmail.com' AND phone IS NULL;