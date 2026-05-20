-- Active: 1777968422854@@127.0.0.1@5050@mydb@public

CREATE TABLE events (
    event_id int PRIMARY KEY,
    event_name VARCHAR(50),
    start_date DATE
);

table events;

INSERT INTO events (event_id, event_name, start_date) VALUES
(1, 'Event A', '2024-01-01'),
(2, 'Event B', '2024-01-05'),
(3, 'Event C', '2024-01-10');

SELECT e1.event_name AS "Event Now", e2.event_name AS "Event Next"
FROM events e1
LEFT JOIN events e2 ON e1.start_date < e1.start_date;

-- menampilkan event-event selanjutnya dari setiap element
-- self join 
SELECT 
    e1.event_name AS "Event Now", 
    string_agg(
        COALESCE(e2.event_name, 'no next event'), ', ' 
        ) AS "Next_Event"
FROM events e1
LEFT JOIN events e2 ON e1.start_date < e2.start_date
GROUP BY e1.event_name;