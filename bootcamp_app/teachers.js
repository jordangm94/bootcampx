const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

//Slice out node and teachers.js in input and store third input in variable. 
const cohortDATE = process.argv.slice(2);

//Incorporate this input into the SQL statement,so our cohorts.name will be what we input. 
pool
  .query(
    //Input our variables with our terminal input into our SQL query
    //LIKE statements looks for something THAT starts with date inputted
    `
    SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
    FROM teachers
    JOIN assistance_requests ON teachers.id=teacher_id 
    JOIN students ON student_id=students.id
    JOIN cohorts ON cohort_id=cohorts.id
    WHERE cohorts.name = '${cohortDATE}'
    ORDER BY teacher;
`
  )
  //Adjust promise statement accordingly to tackle and print information accordingly
  //Notice how teacher is object in paranthesis, and we call upon that object using the aliases from SQL!
  .then((res) => {
    res.rows.forEach((teacher) => {
      console.log(
        `${teacher.cohort}: ${teacher.teacher}`
      );
    });
  })
  .catch((err) => console.error("query error", err.stack));
