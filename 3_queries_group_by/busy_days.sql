-- Get the total number of assignments for each day where the total assignments is greater than or equal to 10

SELECT day, COUNT(*) AS total_assignments -- Select the day and count of assignments
FROM assignments -- Start with the assignments table
GROUP BY day -- Group the results by the day
HAVING COUNT(*) >= 10 -- Filter for days with total assignments greater than or equal to 10
ORDER BY day; -- Order the results by the day
