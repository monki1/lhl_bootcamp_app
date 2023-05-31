-- Get all cohorts with 18 or more students

SELECT cohorts.name AS cohort_name, COUNT(students.*) AS student_count -- Select the cohort name and count of students
FROM cohorts -- Start with the cohorts table
JOIN students ON cohorts.id = students.cohort_id -- Join cohorts table with students table based on cohort_id
GROUP BY cohort_name -- Group the results by cohort_name
HAVING COUNT(students.*) >= 18 -- Filter for cohorts with 18 or more students
ORDER BY student_count; -- Order the results by student_count
