const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

//Slice out node and teachers.js in input and store third input in variable. 
const cohortDATE = process.argv.slice(2)[0];
//EXTREMELY IMPORTANT NOTE: This value is stored inside cohortdate, which is passed to query params,
//If you do not target the value specifically, i.e. including [0], slice, will give you an array with value.
//This will mean inside query params you will have array, with array inside that contains yur value. 
//Query does not like this and will stop your code from working. Keep this in mind! 

//Store information inserted by user into queryParams
const queryParams = [cohortDATE]

const queryString =     `
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
  JOIN assistance_requests ON teachers.id=teacher_id 
  JOIN students ON student_id=students.id
  JOIN cohorts ON cohort_id=cohorts.id
  WHERE cohorts.name = $1
  ORDER BY teacher`

//Incorporate this input into the SQL statement,so our cohorts.name will be what we input. 
pool
  .query(
    //Input our variables with our terminal input into our SQL query
    //LIKE statements looks for something THAT starts with date inputted
    queryString, queryParams)
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
