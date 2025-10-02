SET SQL_SAFE_UPDATES = 0;
-- Your DELETE or UPDATE statement
DELETE FROM user;
-- Optionally, re-enable safe updates
SET SQL_SAFE_UPDATES = 1;

INSERT INTO `user` (`id`, `username`, `password_hash`, `email`) VALUES
(1, 'admin_gp', 'hashed_password1', 'admin@grandpalace.com'),
(2, 'manager_gp', 'hashed_password2', 'manager@grandpalace.com'),
(3, 'reception_gp', 'hashed_password3', 'reception@grandpalace.com'),
(4, 'manager_ov', 'hashed_password4', 'manager@oceanview.com'),
(5, 'reception_ov', 'hashed_password5', 'reception@oceanview.com'),
(6, 'housekeeping_ov', 'hashed_password6', 'housekeeping@oceanview.com'),
(7, 'user_john', 'hashed_password7', 'john.doe@example.com'),
(8, 'user_maria', 'hashed_password8', 'maria.garcia@example.com'),
(9, 'user_li', 'hashed_password9', 'li.wei@example.com'),
(10, 'user_ahmed', 'hashed_password10', 'ahmed.khan@example.com'),
(11, 'user_sophia', 'hashed_password11', 'sophia.martin@example.com'),
(12, 'user_oliver', 'hashed_password12', 'oliver.brown@example.com'),
(13, 'user_emily', 'hashed_password13', 'emily.jones@example.com'),
(14, 'user_noah', 'hashed_password14', 'noah.davis@example.com'),
(15, 'user_chloe', 'hashed_password15', 'chloe.miller@example.com'),
(16, 'user_liam', 'hashed_password16', 'liam.wilson@example.com'),
(17, 'user_amanda', 'hashed_password17', 'amanda.moore@example.com'),
(18, 'user_ryan', 'hashed_password18', 'ryan.taylor@example.com'),
(19, 'user_elena', 'hashed_password19', 'elena.anderson@example.com'),
(20, 'user_daniel', 'hashed_password20', 'daniel.thomas@example.com');
