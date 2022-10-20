const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});
//Result from pool query and promise will be a javascript object! Returned in res.
//Specificially res.rows returns the array of objects with the information we are seeking!
// pool
//   .query(
//     `
// SELECT id, name, cohort_id
// FROM students
// LIMIT 5;
// `
//   )
//   .then((res) => {
//     console.log(res.rows);
//   })
//   .catch((err) => console.error("query error", err.stack));

//Add adjustment to loop through array of objects, get information we need and substitute it into
//our console string.

//Store what would be limit in a variable, forth entry into terminal
const limit = process.argv.slice(3)[0];

//Store what would be DATE in a variable, third entry into terminal. Slice at 2, will give [FEB, 12], therefore target array index 0 as well. 
const DATE = process.argv.slice(2)[0];


console.log(limit);
//Values that will be inserted by user will be stored in an array within availabe. 
const queryParams = [`${DATE}%`, limit ]

const queryString =     `
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2`

pool.query(
    //Input our variables with our terminal input into our SQL query
    //LIKE statements looks for something THAT starts with date inputted
queryString, queryParams)
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(
        `${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`
      );
    });
  })
  .catch((err) => console.error("query error", err.stack));

//Creating for each loop that will loop through array of objects
//The for each loop goes into the array and gets us each individual javascript object.
//We then place those objects in a callback function under the name user.