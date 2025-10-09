package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    List<Payment> findAll(); // Admin

    @Query("""
        SELECT p FROM Payment p
        JOIN p.reservation r
        JOIN Staff s ON s.hotel.id = r.hotel.id
        WHERE s.user.id = :userId
    """)
    List<Payment> findByUserHotels(@Param("userId") Long userId);

    @Query("""
            SELECT p FROM Payment p
            JOIN p.reservation r
            WHERE r.hotel.id IN :hotelIds
            """)
    List<Payment> findByHotelIdIn(@Param("hotelIds") List<Long> hotelIds);

    @Query("SELECT p FROM Payment p WHERE p.reservation.customer.id = :customerId")
    List<Payment> findByCustomerId(@Param("customerId") Long customerId);
}
