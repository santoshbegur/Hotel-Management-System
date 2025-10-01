package com.example.hotelmanagement.util;

import com.example.hotelmanagement.entity.Payment;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TransactionIdGenerator {

    public static String generateTransactionId(Payment payment) {
        // Currency code (3 letters)
        String currencyCode = payment.getCurrency() != null ? payment.getCurrency().substring(0, 3).toUpperCase() : "XXX";

        // Reservation ID (3 digits)
        Long reservationId = payment.getReservation() != null ? payment.getReservation().getId() : 0L;
        String resIdStr = String.format("%03d", reservationId);

        // User ID (3 digits) via Reservation -> Customer
        Long userId = (payment.getReservation() != null && payment.getReservation().getCustomer() != null) ? payment.getReservation().getCustomer().getId() : 0L;
        String userIdStr = String.format("%03d", userId);

        // Payment method code (2 letters)
        String methodCode = switch (payment.getMethod().toUpperCase()) {
            case "CREDIT CARD" -> "CC";
            case "DEBIT CARD" -> "DC";
            case "UPI" -> "UP";
            case "PAYPAL" -> "PP";
            case "CASH" -> "CS";
            case "NET BANKING" -> "NB";
            default -> "XX";
        };

        // Timestamp (DDMMYYYYHHMMSS)
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("ddMMyyyyHHmmss"));

        // Build transaction ID
        return "TXN" + currencyCode + resIdStr + userIdStr + methodCode + timestamp;
    }

}
