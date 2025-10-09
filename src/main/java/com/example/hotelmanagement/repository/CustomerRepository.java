package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    List<Customer> findAll(); // For admin

    @Query("""
        SELECT DISTINCT c
        FROM Customer c
        JOIN Reservation r ON r.customer.id = c.id
        JOIN Staff s ON s.hotel.id = r.hotel.id
        WHERE s.user.id = :userId
    """)
    List<Customer> findByUserHotels(@Param("userId") Long userId);

    @Query("""
        SELECT DISTINCT c FROM Customer c
        JOIN Reservation r ON c.id = r.customer.id
        WHERE r.hotel.id IN :hotelIds
    """)
    List<Customer> findByHotelIdIn(@Param("hotelIds") List<Long> hotelIds);

    @Query("SELECT c FROM Customer c WHERE c.id = :customerId")
    Customer findByCustomerId(@Param("customerId") Long customerId);
}
