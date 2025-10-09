package com.example.hotelmanagement.service;

import com.example.hotelmanagement.entity.*;
import com.example.hotelmanagement.repository.*;
import com.example.hotelmanagement.security.service.model.CustomUserDetails;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HotelDataService {

    private final HotelRepository hotelRepository;
    private final ReservationRepository reservationRepository;
    private final PaymentRepository paymentRepository;
    private final RoomRepository roomRepository;
    private final HousekeepingEventRepository housekeepingRepository;
    private final CustomerRepository customerRepository;
    private final StaffRepository staffRepository;

    // ---------- HOTELS ----------
    public List<Hotel> getHotelsForUser(CustomUserDetails userDetails) {
        if (isAdmin(userDetails)) return hotelRepository.findAll();

        if (isCustomer(userDetails))
            return hotelRepository.findDistinctByReservationsCustomerId(userDetails.getUser().getId());

        List<Long> hotelIds = staffRepository.findHotelIdsByUserId(userDetails.getUser().getId());
        return hotelRepository.findByIdIn(hotelIds);
    }

    // ---------- RESERVATIONS ----------
    public List<Reservation> getReservationsForUser(CustomUserDetails userDetails) {
        if (isAdmin(userDetails)) return reservationRepository.findAll();

        if (isCustomer(userDetails))
            return reservationRepository.findByCustomerId(userDetails.getUser().getId());

        List<Long> hotelIds = staffRepository.findHotelIdsByUserId(userDetails.getUser().getId());
        return reservationRepository.findByHotelIdIn(hotelIds);
    }

    // ---------- PAYMENTS ----------
    public List<Payment> getPaymentsForUser(CustomUserDetails userDetails) {
        if (isAdmin(userDetails)) return paymentRepository.findAll();

        if (isCustomer(userDetails))
            return paymentRepository.findByCustomerId(userDetails.getUser().getId());

        List<Long> hotelIds = staffRepository.findHotelIdsByUserId(userDetails.getUser().getId());
        return paymentRepository.findByHotelIdIn(hotelIds);
    }

    // ---------- ROOMS ----------
    public List<Room> getRoomsForUser(CustomUserDetails userDetails) {
        if (isAdmin(userDetails)) {
            return roomRepository.findAll();
        }

        if (isCustomer(userDetails)) {
            return roomRepository.findRoomsByCustomerId(userDetails.getUser().getId());
        }

        List<Long> hotelIds = staffRepository.findHotelIdsByUserId(userDetails.getUser().getId());
        return roomRepository.findByHotelIdIn(hotelIds);
    }

    // ---------- CUSTOMERS ----------
    public List<Customer> getCustomersForUser(CustomUserDetails userDetails) {
        if (isAdmin(userDetails)) return customerRepository.findAll();

        if (isCustomer(userDetails))
            return customerRepository.findById(userDetails.getUser().getId())
                    .map(List::of)
                    .orElse(List.of());

        List<Long> hotelIds = staffRepository.findHotelIdsByUserId(userDetails.getUser().getId());
        return customerRepository.findByHotelIdIn(hotelIds);
    }

    // ---------- HOUSEKEEPING ----------
    public List<HousekeepingEvent> getHousekeepingForUser(CustomUserDetails userDetails) {
        if (isAdmin(userDetails)) return housekeepingRepository.findAll();

        if (isCustomer(userDetails))
            return housekeepingRepository.findByCustomerId(userDetails.getUser().getId());

        List<Long> hotelIds = staffRepository.findHotelIdsByUserId(userDetails.getUser().getId());
        return housekeepingRepository.findByHotelIdIn(hotelIds);
    }

    // ---------- ROLE CHECKS ----------
    private boolean isAdmin(CustomUserDetails userDetails) {
        return userDetails.getRoles().stream()
                .anyMatch(r -> r.getName().equalsIgnoreCase("ADMIN"));
    }

    private boolean isCustomer(CustomUserDetails userDetails) {
        return userDetails.getRoles().stream()
                .anyMatch(r -> r.getName().equalsIgnoreCase("CUSTOMER"));
    }

    // ---------- STAFF ----------
    public List<Staff> getStaffForUser(CustomUserDetails userDetails) {
        if (isAdmin(userDetails)) {
            return staffRepository.findAll();
        }

        List<Long> hotelIds = staffRepository.findHotelIdsByUserId(userDetails.getUser().getId());
        return staffRepository.findByHotelIdIn(hotelIds);
    }

}
