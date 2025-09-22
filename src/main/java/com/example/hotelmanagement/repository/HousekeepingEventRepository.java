package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.HousekeepingEvent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HousekeepingEventRepository extends JpaRepository<HousekeepingEvent, Long> {
}
