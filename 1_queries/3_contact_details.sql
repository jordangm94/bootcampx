SELECT name, id, cohort_id

from students

WHERE email IS null OR phone IS null;