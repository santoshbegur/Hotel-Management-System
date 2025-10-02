INSERT INTO housekeeping_event (room_id, status, reported_at, handled_by) VALUES
(1, 'PENDING', NOW(), 1),
(2, 'IN_PROGRESS', NOW(), 2),
(3, 'COMPLETED', NOW(), 3),
(4, 'PENDING', NOW(), NULL),        -- unassigned staff
(1, 'IN_PROGRESS', NOW(), 2),
(3, 'PENDING', NOW(), 1);