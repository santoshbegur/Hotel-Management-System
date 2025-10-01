package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Reservation;
import com.example.hotelmanagement.repository.CustomerRepository;
import com.example.hotelmanagement.repository.HotelRepository;
import com.example.hotelmanagement.repository.ReservationRepository;
import com.example.hotelmanagement.repository.RoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
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
        Reservation reservation = reservationRepository.getReservationById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid reservation Id:" + id));
        if (reservation == null) {
            throw new IllegalArgumentException("Invalid reservation ID: " + id);
        }
        model.addAttribute("reservation", reservation);
        model.addAttribute("customers", customerRepository.findAll());
        model.addAttribute("hotels", hotelRepository.findAll());
        return "reservations/reservations_form";
    }


    // Handle update
    @PostMapping("/update")
    public String updateReservation(@ModelAttribute Reservation reservation,
                                    RedirectAttributes redirectAttributes) {

        // Null-safe handling
        if (reservation.getReservationLines() == null) {
            reservation.setReservationLines(new ArrayList<>());
        }

        // Example duplicate booking check
        boolean exists = reservationRepository
                .findOverlappingReservation(
                        reservation.getHotel(),
                        reservation.getCheckInDate(),
                        reservation.getCheckOutDate(),
                        reservation.getId()
                ).isPresent();

        if (exists) {
            redirectAttributes.addFlashAttribute("error",
                    "A reservation already exists for this hotel with the same dates!");
            return "redirect:/reservations/edit/" + reservation.getId();
        }

        reservationRepository.save(reservation);
        return "redirect:/reservations/reservations_list";
    }


    // Delete reservation
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteReservation(@PathVariable Long id) {
        try {
            reservationRepository.deleteById(id);
            return ResponseEntity.ok().build(); // 200 OK on success
        } catch (DataIntegrityViolationException e) {
            // return 409 Conflict
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
