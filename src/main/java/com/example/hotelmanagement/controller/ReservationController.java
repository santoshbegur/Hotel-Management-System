package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Reservation;
import com.example.hotelmanagement.repository.CustomerRepository;
import com.example.hotelmanagement.repository.HotelRepository;
import com.example.hotelmanagement.repository.ReservationRepository;
import com.example.hotelmanagement.repository.RoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reservations/reservations_list")
@RequiredArgsConstructor
public class ReservationController {

    private final ReservationRepository reservationRepository;
    private final CustomerRepository customerRepository;
    private final RoomRepository roomRepository;
    private final HotelRepository hotelRepository;

    // List all reservations
    @GetMapping
    public String listReservations(Model model) {
        List<Reservation> reservations = reservationRepository.findAll();
        model.addAttribute("reservations", reservations);
        return "reservations/reservations_list";
    }

    // Show create form
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        Reservation reservation = new Reservation();
        model.addAttribute("reservation", reservation);
        model.addAttribute("customers", customerRepository.findAll());
        model.addAttribute("hotels", hotelRepository.findAll());
        model.addAttribute("formAction", "/reservations/create");
        return "reservations/reservations_form";
    }

    // Handle create
    @PostMapping("/create")
    public String createReservation(@ModelAttribute Reservation reservation) {
        reservationRepository.save(reservation);
        return "redirect:/reservations/reservations_list";
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Reservation reservation = reservationRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid reservation Id:" + id));
        model.addAttribute("reservation", reservation);
        model.addAttribute("customers", customerRepository.findAll());
        model.addAttribute("hotels", hotelRepository.findAll());
        return "reservations/reservations_form";
    }


    // Handle update
    @PostMapping("/update/{id}")
    public String updateReservation(@PathVariable Long id, @ModelAttribute Reservation reservation) {
        reservation.setId(id); // ensure correct ID
        reservationRepository.save(reservation);
        return "redirect:/reservations/reservations_list";
    }

    // Delete reservation
    @GetMapping("/delete/{id}")
    public String deleteReservation(@PathVariable Long id) {
        reservationRepository.deleteById(id);
        return "redirect:/reservations/reservations_list";
    }
}
