ALTER TABLE housekeeping_event 
MODIFY COLUMN status VARCHAR(255) NOT NULL DEFAULT 'PENDING',
MODIFY COLUMN reported_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

SELECT room_id, status, COUNT(*) AS count
FROM housekeeping_event
GROUP BY room_id, status
HAVING count > 1;

DELETE h
FROM housekeeping_event h
JOIN staff s ON h.handled_by = s.id
JOIN user u ON s.user_id = u.id
WHERE h.room_id = 401
  AND u.username = 'reception_gp';
  
ALTER TABLE housekeeping_event
ADD CONSTRAINT unique_room_status UNIQUE (room_id, status);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM housekeeping_event
WHERE id IN (
    SELECT * FROM (
        SELECT h1.id
        FROM housekeeping_event h1
        JOIN housekeeping_event h2
        ON h1.room_id = h2.room_id
        AND h1.status = h2.status
        AND h1.id > h2.id
    ) AS temp
);
