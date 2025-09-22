package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Payment;
import com.example.hotelmanagement.service.PaymentService;
import com.example.hotelmanagement.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/payments/payments_list")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private ReservationService reservationService;

    @GetMapping
    public String listPayments(Model model) {
        model.addAttribute("payments", paymentService.getAllPayments());
        return "payments/payments_list";
    }

    @GetMapping("/new")
    public String createPaymentForm(Model model) {
        model.addAttribute("payments", new Payment());
        model.addAttribute("reservations", reservationService.getAllReservations());
        return "payments/payments_list";
    }

    @GetMapping("/edit/{id}")
    public String editPaymentForm(@PathVariable Long id, Model model) {
        model.addAttribute("payments", paymentService.getPaymentById(id));
        model.addAttribute("reservations", reservationService.getAllReservations());
        return "payments/payments_form";
    }

    @PostMapping("/save")
    public String savePayment(@ModelAttribute("payments") Payment payment) {
        paymentService.savePayment(payment);
        return "redirect:/payments/payments_list";
    }

    @GetMapping("/delete/{id}")
    public String deletePayment(@PathVariable Long id) {
        paymentService.deletePayment(id);
        return "redirect:/payments/payments_list";
    }
}
