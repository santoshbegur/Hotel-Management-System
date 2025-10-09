package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    @Query("SELECT r FROM Reservation r " +
            "WHERE r.hotel = :hotel " +
            "AND r.id <> :id " +
            "AND (r.checkInDate < :checkOutDate AND r.checkOutDate > :checkInDate)")
    Optional<Reservation> findOverlappingReservation(
            @Param("hotel") Hotel hotel,
            @Param("checkInDate") LocalDate checkInDate,
            @Param("checkOutDate") LocalDate checkOutDate,
            @Param("id") Long id
    );

    // Revenue report for date range
    @Query("SELECT r FROM Reservation r WHERE r.checkInDate BETWEEN :start AND :end")
    List<Reservation> findReservationsBetweenDates(LocalDate start, LocalDate end);

    // All active reservations for a specific date (for occupancy)
    @Query("SELECT r FROM Reservation r WHERE :date BETWEEN r.checkInDate AND r.checkOutDate")
    List<Reservation> findActiveReservationsOnDate(LocalDate date);

    @Query("SELECT r FROM Reservation r " +
            "LEFT JOIN FETCH r.reservationLines rl " +
            "LEFT JOIN FETCH rl.room rm " +
            "LEFT JOIN FETCH rm.hotel h " +
            "WHERE (:isAdmin = true OR h.id IN :hotelIds)")
    List<Reservation> findAllByUserHotels(@Param("isAdmin") boolean isAdmin,
                                          @Param("hotelIds") List<Long> hotelIds);

    // Find by hotel ID (navigating through ReservationLine → Room → Hotel)
    @Query("SELECT DISTINCT r FROM Reservation r " +
            "LEFT JOIN r.reservationLines rl " +
            "LEFT JOIN rl.room rm " +
            "LEFT JOIN rm.hotel h " +
            "WHERE h.id = :hotelId")
    List<Reservation> findByHotelId(@Param("hotelId") Long hotelId);

    // Find by user who created reservation
    @Query("SELECT DISTINCT r FROM Reservation r " +
            "LEFT JOIN FETCH r.reservationLines rl " +
            "LEFT JOIN FETCH rl.room rm " +
            "LEFT JOIN FETCH rm.hotel h " +
            "WHERE r.createdBy = :createdBy")
    List<Reservation> findByCreatedBy(@Param("createdBy") String createdBy);

    // Find by user and hotel
    @Query("SELECT DISTINCT r FROM Reservation r " +
            "LEFT JOIN r.reservationLines rl " +
            "LEFT JOIN rl.room rm " +
            "LEFT JOIN rm.hotel h " +
            "WHERE r.createdBy = :createdBy AND h.id = :hotelId")
    List<Reservation> findByCreatedByAndHotelId(@Param("createdBy") String createdBy,
                                                @Param("hotelId") Long hotelId);


    // Fetch reservations for a user, but admins see all
    @Query("SELECT DISTINCT r FROM Reservation r " +
            "LEFT JOIN FETCH r.reservationLines rl " +
            "LEFT JOIN FETCH rl.room rm " +
            "LEFT JOIN FETCH rm.hotel h " +
            "WHERE (:isAdmin = true OR r.createdBy = :username)")
    List<Reservation> findReservationsForUser(@Param("username") String username,
                                              @Param("isAdmin") boolean isAdmin);

    @Query("SELECT DISTINCT r FROM Reservation r " +
            "LEFT JOIN FETCH r.reservationLines rl " +
            "LEFT JOIN FETCH rl.room rm " +
            "LEFT JOIN FETCH rm.hotel h")
    List<Reservation> findAllWithLines();

}
