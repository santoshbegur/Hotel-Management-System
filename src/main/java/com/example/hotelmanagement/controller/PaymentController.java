package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Payment;
import com.example.hotelmanagement.security.service.model.CustomUserDetails;
import com.example.hotelmanagement.service.HotelDataService;
import com.example.hotelmanagement.service.PaymentService;
import com.example.hotelmanagement.service.ReservationService;
import com.example.hotelmanagement.util.TransactionIdGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/payments/payments_list")
@RequiredArgsConstructor
public class PaymentController {
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private final HotelDataService hotelDataService;

    // List payments
    @GetMapping
    public String listPayments(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

        List<Payment> payments = hotelDataService.getPaymentsForUser(userDetails);
        model.addAttribute("payments", payments);
        return "payments/payments_list";  // list fragment
    }

    // Show create payment form
    @GetMapping("/create")
    public String createPaymentForm(Model model) {
        model.addAttribute("payment", new Payment());   // singular (not "payments")
        model.addAttribute("reservations", reservationService.getAllReservations());
        return "payments/payments_form";  // should load form fragment
    }

    // Save or update payment
    @PostMapping("/create")
    public String savePayment(@ModelAttribute("payment") Payment payment) {
        // Only generate transaction ID if it's a new payment
        if (payment.getId() == null || payment.getTransactionId() == null) {
            String txnId = TransactionIdGenerator.generateTransactionId(payment);
            payment.setTransactionId(txnId);
        }
        // save payment
        paymentService.savePayment(payment);
        return "redirect:/payments/payments_list";
    }

    // Show edit payment form
    @GetMapping("/edit/{id}")
    public String editPaymentForm(@PathVariable Long id, Model model) {
        Payment payment = paymentService.getPaymentById(id);
        if (payment == null) {
            throw new IllegalArgumentException("Invalid payment ID: " + id);
        }
        model.addAttribute("payment", payment);
        model.addAttribute("reservations", reservationService.getAllReservations());
        return "payments/payments_form";
    }

    @PostMapping("/update")
    public String updatePayment(@ModelAttribute Payment payment, RedirectAttributes redirectAttributes) {
        // Optional: regenerate transaction ID only if missing
        if (payment.getTransactionId() == null) {
            payment.setTransactionId(TransactionIdGenerator.generateTransactionId(payment));
        }

        paymentService.savePayment(payment);
        redirectAttributes.addFlashAttribute("success", "Payment updated successfully!");
        return "redirect:/payments/payments_list";
    }

    // Delete payment
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deletePayment(@PathVariable Long id) {
        try {
            paymentService.deletePayment(id);
            return ResponseEntity.ok().build(); // 200 OK
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build(); // 409 Conflict
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
