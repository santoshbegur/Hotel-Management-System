package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface HotelRepository extends JpaRepository<Hotel, Long> {

    // Find hotel by all fields except the given id (for edit)
    Optional<Hotel> findByNameAndAddressAndPhoneAndTimezoneAndIdNot(
            String name, String address, String phone, String timezone, Long id);

    // Find hotel by all fields (for adding new)
    Optional<Hotel> findByNameAndAddressAndPhoneAndTimezone(
            String name, String address, String phone, String timezone);

    // Find hotel for pagination and searching
    Page<Hotel> findByNameContainingIgnoreCaseOrAddressContainingIgnoreCase(String name, String address, Pageable pageable);

    // Find hotels where this user is a manager
    List<Hotel> findByManagersContains(User user);

    // Find hotels where this user is assigned as staff (receptionist, housekeeping, etc.)
    List<Hotel> findByStaffContains(User user);

    // Admin: all hotels
    List<Hotel> findAll();

    // Admin: find by a list of ids
    List<Hotel> findByIdIn(List<Long> hotelIds);

    // Non-admin: hotels assigned to this user via Staff
    @Query("SELECT s.hotel FROM Staff s WHERE s.user.id = :userId")
    List<Hotel> findByUserHotels(@Param("userId") Long userId);

    // Hotels where a specific customer has reservations
    @Query("SELECT DISTINCT r.hotel FROM Reservation r WHERE r.customer.id = :customerId")
    List<Hotel> findDistinctByReservationsCustomerId(@Param("customerId") Long customerId);
}
