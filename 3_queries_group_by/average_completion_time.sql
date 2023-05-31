-- Get currently enrolled students' average assignment completion time

SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration -- Select the student name and average assignment duration
FROM students -- Start with the students table
JOIN assignment_submissions ON students.id = assignment_submissions.student_id -- Join students table with assignment_submissions table based on student_id
WHERE students.end_date IS NULL -- Filter for currently enrolled students (null end_date)
GROUP BY students.name -- Group the results by student name
ORDER BY average_assignment_duration DESC; -- Order the results by average assignment duration in descending order
