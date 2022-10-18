--This finds us the average amount of time a students waits for a request
-- From assistance_requests table

SELECT AVG(started_at - created_at) as average_wait_time

FROM assistance_requests;