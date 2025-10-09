package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Reservation;
import com.example.hotelmanagement.entity.ReservationLine;
import com.example.hotelmanagement.security.service.model.CustomUserDetails;
import com.example.hotelmanagement.service.*;
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

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/reservations/reservations_list")
@RequiredArgsConstructor
public class ReservationController {
    @Autowired
    private final ReservationService reservationService;
    @Autowired
    private final CustomerService customerService;
    @Autowired
    private final RoomService roomService;
    @Autowired
    private final HotelService hotelService;
    @Autowired
    private final HotelDataService hotelDataService;
    // List all reservations
    @GetMapping
    public String listReservations(Model model) {
        // Get logged-in user
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        List<Reservation> reservations = hotelDataService.getReservationsForUser(userDetails);
        model.addAttribute("reservations", reservations);
        return "reservations/reservations_list";
    }

    // Show create form
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        Reservation reservation = new Reservation();

        // Ensure at least one ReservationLine exists for edit
        if (reservation.getReservationLines() == null || reservation.getReservationLines().isEmpty()) {
            List<ReservationLine> lines = new ArrayList<>();
            lines.add(new ReservationLine());
            reservation.setReservationLines(lines);
        }
        // Ensure parent reference
        for (ReservationLine line : reservation.getReservationLines()) {
            line.setReservation(reservation);
        }
        model.addAttribute("reservation", reservation);
        model.addAttribute("customers", customerService.getAllCustomers());
        model.addAttribute("hotels", hotelService.findAllHotels());
        model.addAttribute("rooms", roomService.findAllRooms()); // Needed for room selection
        model.addAttribute("formAction", "/reservations/create");
        return "reservations/reservations_form";
    }

    // Handle create
    @PostMapping("/create")
    public String createReservation(@ModelAttribute Reservation reservation) {

        // Ensure at least one ReservationLine exists for edit
        if (reservation.getReservationLines() == null || reservation.getReservationLines().isEmpty()) {
            List<ReservationLine> lines = new ArrayList<>();
            lines.add(new ReservationLine());
            reservation.setReservationLines(lines);
        }

        // Ensure parent reference
        for (ReservationLine line : reservation.getReservationLines()) {
            line.setReservation(reservation);
        }

        reservationService.saveReservation(reservation);
        return "redirect:/reservations/reservations_list";
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Reservation reservation = reservationService.getReservationById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid reservation Id:" + id));

        // Ensure at least one ReservationLine exists for edit
        if (reservation.getReservationLines() == null || reservation.getReservationLines().isEmpty()) {
            List<ReservationLine> lines = new ArrayList<>();
            lines.add(new ReservationLine());
            reservation.setReservationLines(lines);
        }
        // Ensure parent reference
        for (ReservationLine line : reservation.getReservationLines()) {
            line.setReservation(reservation);
        }

        model.addAttribute("reservation", reservation);
        model.addAttribute("customers", customerService.getAllCustomers());
        model.addAttribute("hotels", hotelService.findAllHotels());
        model.addAttribute("rooms", roomService.findAllRooms()); // Needed for room selection
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

        // Ensure parent reference
        for (ReservationLine line : reservation.getReservationLines()) {
            line.setReservation(reservation);
        }

        // Example duplicate booking check
        boolean exists = reservationService
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

        reservationService.saveReservation(reservation);
        return "redirect:/reservations/reservations_list";
    }

    // Delete reservation
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteReservation(@PathVariable Long id) {
        try {
            reservationService.deleteReservation(id);
            return ResponseEntity.ok().build(); // 200 OK on success
        } catch (DataIntegrityViolationException e) {
            // return 409 Conflict
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
