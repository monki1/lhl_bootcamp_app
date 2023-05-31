-- Get the total number of assignment submissions for each cohort

SELECT cohorts.name AS cohort, COUNT(assignment_submissions.id) AS total_submissions -- Select the cohort name and count of assignment submissions
FROM cohorts -- Start with the cohorts table
JOIN students ON cohorts.id = students.cohort_id -- Join cohorts table with students table based on cohort_id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id -- Join students table with assignment_submissions table based on student_id
GROUP BY cohorts.name -- Group the results by cohort name
ORDER BY total_submissions DESC; -- Order the results by total submissions count in descending order
