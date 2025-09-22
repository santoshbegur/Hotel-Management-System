package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.ReservationLine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReservationLineRepository extends JpaRepository<ReservationLine, Long> {
}
