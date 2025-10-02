INSERT INTO `payment` 
(`id`, `reservation_id`, `amount`, `currency`, `method`, `status`, `transaction_id`) VALUES
(1, 1, 250.00, 'USD', 'Credit Card', 'Completed', 'TXN10001US'),
(2, 2, 180.00, 'USD', 'PayPal', 'Completed', 'TXN10002PP'),
(3, 3, 7200.00, 'INR', 'UPI', 'Completed', 'TXN10003UP'),
(4, 4, 5600.00, 'INR', 'Credit Card', 'Pending', 'TXN10004CC'),
(5, 5, 450.00, 'EUR', 'Debit Card', 'Completed', 'TXN10005DC'),

(6, 6, 12000.00, 'INR', 'Cash', 'Completed', 'TXN10006CS'),
(7, 7, 300.00, 'USD', 'Credit Card', 'Completed', 'TXN10007US'),
(8, 8, 220.00, 'EUR', 'Debit Card', 'Failed', 'TXN10008DC'),
(9, 9, 8900.00, 'INR', 'UPI', 'Completed', 'TXN10009UP'),
(10, 10, 150.00, 'USD', 'PayPal', 'Completed', 'TXN10010PP'),

(11, 11, 4000.00, 'INR', 'Credit Card', 'Refunded', 'TXN10011RF'),
(12, 12, 560.00, 'EUR', 'Debit Card', 'Completed', 'TXN10012DC'),
(13, 13, 7500.00, 'INR', 'UPI', 'Completed', 'TXN10013UP'),
(14, 14, 275.00, 'USD', 'Credit Card', 'Completed', 'TXN10014US'),
(15, 15, 13500.00, 'INR', 'Cash', 'Completed', 'TXN10015CS'),

(16, 16, 620.00, 'EUR', 'Debit Card', 'Pending', 'TXN10016DC'),
(17, 17, 9800.00, 'INR', 'UPI', 'Completed', 'TXN10017UP'),
(18, 18, 330.00, 'USD', 'Credit Card', 'Failed', 'TXN10018CC'),
(19, 19, 240.00, 'EUR', 'PayPal', 'Completed', 'TXN10019PP'),
(20, 20, 11200.00, 'INR', 'UPI', 'Completed', 'TXN10020UP');
