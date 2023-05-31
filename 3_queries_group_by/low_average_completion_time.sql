-- Get the students whose average completion time is less than the average suggested completion time

SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_completion_time, AVG(assignments.duration) AS average_suggested_completion_time -- Select the student name, average completion time, and average suggested completion time
FROM students -- Start with the students table
JOIN assignment_submissions ON students.id = assignment_submissions.student_id -- Join students table with assignment_submissions table based on student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id -- Join assignment_submissions table with assignments table based on assignment_id
WHERE students.end_date IS NULL -- Filter for currently enrolled students (null end_date)
GROUP BY students.name -- Group the results by student name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration) -- Filter for average completion time less than average suggested completion time
ORDER BY average_completion_time; -- Order the results by average completion time
