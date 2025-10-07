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

}
