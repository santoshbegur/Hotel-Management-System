-- Hotels
INSERT INTO hotel (id, name, address, phone, timezone)
VALUES
  (1, 'Central Grand Hotel', '123 Main Street, Bengaluru', '+91-9876543210', 'Asia/Kolkata'),
  (2, 'Sea View Resort', 'Beach Road, Goa', '+91-9123456780', 'Asia/Kolkata');

-- Room Types
INSERT INTO room_type (id, hotel_id, code, name, occupancy, base_price)
VALUES
  (1, 1, 'DLX', 'Deluxe Room', 2, 3500.00),
  (2, 1, 'STE', 'Suite', 4, 6000.00),
  (3, 2, 'STD', 'Standard Room', 2, 2500.00),
  (4, 2, 'FAM', 'Family Suite', 5, 7000.00);

-- Rooms
INSERT INTO room (id, hotel_id, room_number, room_type_id, floor, status)
VALUES
  (1, 1, '101', 1, 1, 'AVAILABLE'),
  (2, 1, '102', 2, 1, 'AVAILABLE'),
  (3, 1, '201', 1, 2, 'MAINTENANCE'),
  (4, 2, '301', 3, 3, 'AVAILABLE'),
  (5, 2, '302', 4, 3, 'BOOKED');

-- Customers
INSERT INTO customer (id, first_name, last_name, email, phone)
VALUES
  (1, 'John', 'Doe', 'john@example.com', '9998887776'),
  (2, 'Alice', 'Smith', 'alice@example.com', '8887776665'),
  (3, 'Ravi', 'Kumar', 'ravi.kumar@example.com', '7776665554');

-- Users
INSERT INTO user (id, username, password_hash, email)
VALUES
  (1, 'admin', '$2b$12$CJswAACHgsuPFbGerFygXuxVtIOVWADLo6O6ltPUXaR47NZJx59kS', 'admin@hotel.com'), -- password: admin123
  (2, 'manager1', '$2b$12$xjIGjFRdKWUyl/KvsEfkqORwMU4fTW5L2K/5qTQVx7KRJPkOQ4g5W', 'manager1@hotel.com'); -- password: password

-- Roles
INSERT INTO role (id, name)
VALUES
  (1, 'ADMIN'),
  (2, 'MANAGER'),
  (3, 'CUSTOMER');

-- User Roles
INSERT INTO user_role (user_id, role_id)
VALUES
  (1, 1), -- admin → ADMIN
  (2, 2); -- manager1 → MANAGER

-- Reservations
INSERT INTO reservation (id, hotel_id, customer_id, status, check_in_date, check_out_date, total_amount)
VALUES
  (1, 1, 1, 'BOOKED', '2025-09-20', '2025-09-22', 7000.00),
  (2, 2, 2, 'CHECKED_IN', '2025-09-19', '2025-09-21', 5000.00);

-- Reservation Lines
INSERT INTO reservation_line (id, reservation_id, room_id, price_per_night, nights)
VALUES
  (1, 1, 1, 3500.00, 2), -- John booked Deluxe
  (2, 2, 4, 2500.00, 2); -- Alice booked Standard

-- Payments
INSERT INTO payment (id, reservation_id, amount, currency, method, status, transaction_id)
VALUES
  (1, 1, 7000.00, 'INR', 'CREDIT_CARD', 'PAID', 'TXN123456'),
  (2, 2, 5000.00, 'INR', 'UPI', 'PENDING', 'TXN654321');
  
-- Staff Members
INSERT INTO staff (user_id, hotel_id, role_id, joined_date) VALUES
(1, 1, 1, '2023-05-01'),   -- Admin for Grand Palace
(2, 1, 2, '2023-06-15'),   -- Manager for Grand Palace
(3, 1, 3, '2023-07-20'),   -- Receptionist for Grand Palace
(4, 2, 2, '2023-08-05'),   -- Manager for Ocean View
(5, 2, 3, '2023-08-10'),   -- Receptionist for Ocean View
(6, 2, 4, '2023-09-01');   -- Housekeeping staff for Ocean View

-- Housekeeping Events
INSERT INTO housekeeping_event (room_id, status, reported_at, handled_by) VALUES
(1, 'REPORTED', '2023-08-10 10:15:00', 6),   -- Room 101 reported dirty, handled by staff 6
(1, 'CLEANED',  '2023-08-10 11:00:00', 6),   -- Room 101 cleaned
(2, 'REPORTED', '2023-08-11 09:45:00', 5),   -- Room 102 reported dirty
(2, 'IN_PROGRESS', '2023-08-11 10:00:00', 5),-- Room 102 cleaning started
(2, 'CLEANED', '2023-08-11 10:30:00', 5),   -- Room 102 cleaned
(3, 'REPORTED', '2023-08-12 08:00:00', 6),   -- Room 201 reported needs repair
(3, 'NEEDS_REPAIR', '2023-08-12 09:30:00', 6);

INSERT INTO role (id, name) VALUES
(4, 'RECEPTIONIST'),
(5, 'HOUSEKEEPING');

INSERT INTO hotel (id, name, address, phone, timezone, created_at) VALUES
(3, 'Grand Palace', '123 Main St, Bangalore', '+91-9876543210', 'Asia/Kolkata', NOW()),
(4, 'Ocean View', 'Beach Road, Goa', '+91-9123456780', 'Asia/Kolkata', NOW());

INSERT INTO user (id, username, password_hash, email) VALUES
(3, 'reception_gp', 'hashed_password3', 'reception@grandpalace.com'),
(4, 'manager_ov', 'hashed_password4', 'manager@oceanview.com'),
(5, 'reception_ov', 'hashed_password5', 'reception@oceanview.com'),
(6, 'housekeeping_ov', 'hashed_password6', 'housekeeping@oceanview.com');

INSERT INTO staff (user_id, hotel_id, role_id, joined_date) VALUES
(1, 1, 1, '2023-05-01'),
(2, 1, 2, '2023-06-15'),
(3, 1, 3, '2023-07-20'),
(4, 2, 2, '2023-08-05'),
(5, 2, 3, '2023-08-10'),
(6, 2, 4, '2023-09-01');

-- user table update
UPDATE user 
SET username = 'admin_gp', 
    password_hash = 'hashed_password1', 
    email = 'admin@grandpalace.com'
WHERE id = 1;

UPDATE user 
SET username = 'manager_gp', 
    password_hash = 'hashed_password2', 
    email = 'manager@grandpalace.com'
WHERE id = 2;

UPDATE user 
SET username = 'reception_gp', 
    password_hash = 'hashed_password3', 
    email = 'reception@grandpalace.com'
WHERE id = 3;

UPDATE user 
SET username = 'manager_ov', 
    password_hash = 'hashed_password4', 
    email = 'manager@oceanview.com'
WHERE id = 4;

UPDATE user 
SET username = 'reception_ov', 
    password_hash = 'hashed_password5', 
    email = 'reception@oceanview.com'
WHERE id = 5;

UPDATE user 
SET username = 'housekeeping_ov', 
    password_hash = 'hashed_password6', 
    email = 'housekeeping@oceanview.com'
WHERE id = 6;


-- staff table update

UPDATE staff
SET hotel_id = 1,
    role_id = 1,
    joined_date = '2023-05-01'
WHERE user_id = 1;

UPDATE staff
SET hotel_id = 1,
    role_id = 2,
    joined_date = '2023-06-15'
WHERE user_id = 2;

UPDATE staff
SET hotel_id = 1,
    role_id = 3,
    joined_date = '2023-07-20'
WHERE user_id = 3;

UPDATE staff
SET hotel_id = 2,
    role_id = 2,
    joined_date = '2023-08-05'
WHERE user_id = 4;

UPDATE staff
SET hotel_id = 2,
    role_id = 3,
    joined_date = '2023-08-10'
WHERE user_id = 5;

UPDATE staff
SET hotel_id = 2,
    role_id = 4,
    joined_date = '2023-09-01'
WHERE user_id = 6;

INSERT INTO housekeeping_event (id, room_id, status, reported_at, handled_by) VALUES
(1, 101, 'PENDING', '2025-09-15 09:30:00', 6),   -- housekeeping staff for OceanView
(2, 102, 'IN_PROGRESS', '2025-09-15 10:00:00', 3), -- housekeeping staff for GrandPalace
(3, 103, 'COMPLETED', '2025-09-14 16:20:00', 6),
(4, 104, 'PENDING', '2025-09-16 08:45:00', 5),
(5, 105, 'IN_PROGRESS', '2025-09-16 11:00:00', 3),
(6, 106, 'COMPLETED', '2025-09-13 14:10:00', 6);

INSERT INTO staff (id, user_id, hotel_id, role_id, joined_date) VALUES
(1, 1, 1, 1, '2023-05-01'), -- Admin at Grand Palace
(2, 2, 1, 2, '2023-06-15'), -- Manager at Grand Palace
(3, 3, 1, 3, '2023-07-20'), -- Receptionist at Grand Palace
(4, 4, 2, 2, '2023-08-05'), -- Manager at Ocean View
(5, 5, 2, 3, '2023-08-10'), -- Receptionist at Ocean View
(6, 6, 2, 4, '2023-09-01'); -- Housekeeping at Ocean View


