CREATE TABLE hotel (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    phone VARCHAR(50),
    timezone VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE room_type (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hotel_id BIGINT,
    code VARCHAR(50),
    name VARCHAR(100),
    occupancy INT,
    base_price DECIMAL(10,2),
    CONSTRAINT fk_room_type_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id)
);

CREATE TABLE room (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hotel_id BIGINT,
    room_number VARCHAR(20) NOT NULL,
    room_type_id BIGINT,
    floor INT,
    status VARCHAR(20) DEFAULT 'AVAILABLE',
    CONSTRAINT fk_room_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id),
    CONSTRAINT fk_room_type FOREIGN KEY (room_type_id) REFERENCES room_type(id)
);

CREATE TABLE customer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(50)
);

CREATE TABLE user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE role (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);

CREATE TABLE user_role (
    user_id BIGINT,
    role_id BIGINT,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_user_role_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_user_role_role FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE reservation (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hotel_id BIGINT,
    customer_id BIGINT,
    status VARCHAR(30) DEFAULT 'BOOKED',
    check_in_date DATE,
    check_out_date DATE,
    total_amount DECIMAL(12,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reservation_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id),
    CONSTRAINT fk_reservation_customer FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE reservation_line (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    reservation_id BIGINT,
    room_id BIGINT,
    price_per_night DECIMAL(10,2),
    nights INT,
    CONSTRAINT fk_res_line_reservation FOREIGN KEY (reservation_id) REFERENCES reservation(id),
    CONSTRAINT fk_res_line_room FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE payment (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    reservation_id BIGINT,
    amount DECIMAL(12,2),
    currency VARCHAR(10) DEFAULT 'INR',
    method VARCHAR(50),
    status VARCHAR(30),
    transaction_id VARCHAR(255),
    CONSTRAINT fk_payment_reservation FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE staff (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    hotel_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    joined_date DATE NOT NULL,

    CONSTRAINT fk_staff_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_staff_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id),
    CONSTRAINT fk_staff_role FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE housekeeping_event (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    room_id BIGINT NOT NULL,
    status VARCHAR(50) NOT NULL, -- e.g. 'REPORTED', 'IN_PROGRESS', 'CLEANED', 'NEEDS_REPAIR'
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    handled_by BIGINT, -- staff.id
    
    CONSTRAINT fk_housekeeping_room FOREIGN KEY (room_id) REFERENCES room(id),
    CONSTRAINT fk_housekeeping_staff FOREIGN KEY (handled_by) REFERENCES staff(id)
);

ALTER TABLE room
ADD CONSTRAINT unique_room_per_hotel UNIQUE (room_number, hotel_id);

ALTER TABLE hotel 
MODIFY name VARCHAR(255) NOT NULL,
MODIFY address VARCHAR(500) NOT NULL,
MODIFY phone VARCHAR(50) NOT NULL,
MODIFY timezone VARCHAR(100) NOT NULL;

ALTER TABLE hotel 
ADD UNIQUE KEY unique_hotel (name(191), address(191), phone(50), timezone(100));	

ALTER TABLE reservation
MODIFY COLUMN check_in_date DATE,
MODIFY COLUMN check_out_date DATE;

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
