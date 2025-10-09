package com.example.hotelmanagement.service;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.entity.Reservation;
import com.example.hotelmanagement.entity.User;
import com.example.hotelmanagement.repository.ReservationRepository;
import com.example.hotelmanagement.security.service.model.CustomUserDetails;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private final UserService userService;
    public List<Reservation> getAllReservations() {
        return reservationRepository.findAll();
    }
    // Common utility to get the current logged-in user
    private User getCurrentUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof CustomUserDetails) {
            return ((CustomUserDetails) principal).getUser();
        }
        return null;
    }

    // Fetch reservations based on user role
    public List<Reservation> getReservationsForCurrentUser(CustomUserDetails userDetails) {
        User user = userDetails.getUser();
        String username = user.getUsername();

        if (isAdmin(user)) {
            return reservationRepository.findAllWithLines(); // all reservations
        } else if (isManager(user)) {
            List<Long> hotelIds = user.getHotels().stream()
                    .map(Hotel::getId)
                    .toList();
            return reservationRepository.findAllByUserHotels(false, hotelIds);
        } else {
            // customers or other roles: only reservations they created
            return reservationRepository.findByCreatedBy(username);
        }
    }

    public Optional<Reservation> getReservationById(Long id) {
        return reservationRepository.findById(id);
    }

    public Reservation saveReservation(Reservation reservation) {
        User currentUser = getCurrentUser();
        if (currentUser != null) {
            reservation.setCreatedBy(currentUser.getUsername());
        }
        return reservationRepository.save(reservation);
    }

    public void deleteReservation(Long id) {
        reservationRepository.deleteById(id);
    }

    public Optional<Reservation> findOverlappingReservation(Hotel hotel, LocalDate checkInDate, LocalDate checkOutDate, Long id) {
        return reservationRepository.findOverlappingReservation(hotel, checkInDate, checkOutDate, id);
    }

    public List<Reservation> getReservationsBetweenDates(LocalDate start, LocalDate end) {
        return reservationRepository.findReservationsBetweenDates(start, end);
    }

    public List<Reservation> getActiveReservationsOnDate(LocalDate date) {
        return reservationRepository.findActiveReservationsOnDate(date);
    }

    public boolean isAdmin(User user) {
        return user.getRoles().stream()
                .anyMatch(role -> role.getName().equalsIgnoreCase("ADMIN"));
    }

    public boolean isManager(User user) {
        return user.getRoles().stream()
                .anyMatch(role -> role.getName().equalsIgnoreCase("MANAGER"));
    }

}
