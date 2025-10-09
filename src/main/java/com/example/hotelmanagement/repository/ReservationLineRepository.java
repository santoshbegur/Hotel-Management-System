package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.ReservationLine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReservationLineRepository extends JpaRepository<ReservationLine, Long> {
    List<ReservationLine> findAll(); // Admin

    @Query("""
        SELECT rl
        FROM ReservationLine rl
        JOIN rl.reservation r
        JOIN Staff s ON s.hotel.id = r.hotel.id
        WHERE s.user.id = :userId
    """)
    List<ReservationLine> findByUserHotels(@Param("userId") Long userId);
}

