-- 1661. Average Time of Process per Machine.sql # Write your MySQL query statement below
WITH start_process AS
(
    SELECT
        CONCAT(machine_id, "_", process_id, "_") AS primary_key,
        machine_id,
        timestamp
    FROM
        Activity 
    WHERE
        activity_type = "start"
),
end_process AS
(   
    SELECT
        CONCAT(machine_id, "_", process_id, "_") AS primary_key,
        machine_id,
        timestamp
    FROM
        Activity 
    WHERE
        activity_type = "end"
)

SELECT
        s.machine_id,
        ROUND(SUM(e.timestamp - s.timestamp) / COUNT(s.machine_id), 3) AS processing_time
    FROM 
        start_process AS s
    LEFT JOIN
        end_process AS e
    ON    
        e.primary_key = s.primary_key
    GROUP BY
        s.machine_id

-- Question
/*

*/

-- Respons
/*

*/