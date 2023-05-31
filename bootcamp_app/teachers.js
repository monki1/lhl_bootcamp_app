const pool = require('./pool');

const cohortName = process.argv[2];
const values = [`%${cohortName}%`];

const queryString = `
  SELECT DISTINCT teachers.name as teacher_name, cohorts.name as cohort_name
  FROM teachers
  JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name LIKE $1;
`;

pool.query(queryString, values)
  .then((res) => {
    res.rows.forEach((row) => {
      console.log(`${row.teacher_name} assisted in the ${row.cohort_name} cohort`);
    });
  })
  .catch((err) => console.error('query error', err.stack));
