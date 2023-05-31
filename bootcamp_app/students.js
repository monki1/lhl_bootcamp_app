const pool = require('./pool');

const cohortName = process.argv[2]; // Get the cohort name from command line argument
const limit = parseInt(process.argv[3]); // Get the limit from command line argument and parse it as an integer

pool.query(`
  SELECT students.id, students.name, cohorts.name AS cohort_name
  FROM students
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name = $1
  LIMIT $2;
`, [cohortName, limit])
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));