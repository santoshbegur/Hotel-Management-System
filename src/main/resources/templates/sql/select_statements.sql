SELECT `customer`.`id`,
    `customer`.`first_name`,
    `customer`.`last_name`,
    `customer`.`email`,
    `customer`.`phone`
FROM `hotel_db`.`customer`;

SELECT `hotel`.`id`,
    `hotel`.`name`,
    `hotel`.`address`,
    `hotel`.`phone`,
    `hotel`.`timezone`,
    `hotel`.`created_at`
FROM `hotel_db`.`hotel`;
select distinct timezone from hotel;
SELECT `payment`.`id`,
    `payment`.`reservation_id`,
    `payment`.`amount`,
    `payment`.`currency`,
    `payment`.`method`,
    `payment`.`status`,
    `payment`.`transaction_id`
FROM `hotel_db`.`payment`;

SELECT `reservation`.`id`,
    `reservation`.`hotel_id`,
    `reservation`.`customer_id`,
    `reservation`.`status`,
    `reservation`.`check_in_date`,
    `reservation`.`check_out_date`,
    `reservation`.`total_amount`,
    `reservation`.`created_at`
FROM `hotel_db`.`reservation`;

SELECT `reservation_line`.`id`,
    `reservation_line`.`reservation_id`,
    `reservation_line`.`room_id`,
    `reservation_line`.`price_per_night`,
    `reservation_line`.`nights`
FROM `hotel_db`.`reservation_line`;

SELECT `role`.`id`,
    `role`.`name`
FROM `hotel_db`.`role`;

SELECT `room`.`id`,
    `room`.`hotel_id`,
    `room`.`room_number`,
    `room`.`room_type_id`,
    `room`.`floor`,
    `room`.`status`
FROM `hotel_db`.`room`;

SELECT `room_type`.`id`,
    `room_type`.`hotel_id`,
    `room_type`.`code`,
    `room_type`.`name`,
    `room_type`.`occupancy`,
    `room_type`.`base_price`
FROM `hotel_db`.`room_type`;

SELECT `user`.`id`,
    `user`.`username`,
    `user`.`password_hash`,
    `user`.`email`
FROM `hotel_db`.`user`;

SELECT `user_role`.`user_id`,
    `user_role`.`role_id`
FROM `hotel_db`.`user_role`;

select distinct status from housekeeping_event;
SELECT `housekeeping_event`.`id`,
    `housekeeping_event`.`room_id`,
    `housekeeping_event`.`status`,
    `housekeeping_event`.`reported_at`,
    `housekeeping_event`.`handled_by`
FROM `hotel_db`.`housekeeping_event`;

SELECT `staff`.`id`,
    `staff`.`user_id`,
    `staff`.`hotel_id`,
    `staff`.`role_id`,
    `staff`.`joined_date`
FROM `hotel_db`.`staff`;

