package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.HousekeepingEvent;
import com.example.hotelmanagement.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HousekeepingEventRepository extends JpaRepository<HousekeepingEvent, Long> {
    // Find all events for a specific room
    boolean existsByRoomIdAndStatusIn(Long roomId, List<String> statuses);

    // Checks if there is an active event for a room, excluding a specific event by id
    boolean existsByRoomAndStatusInAndIdNot(Room room, List<String> statuses, Long excludeId);

    // Find all events with status in a list
    List<HousekeepingEvent> findByStatusIn(List<String> statuses);

    // Optional: check if an active event exists for a given room
    boolean existsByRoomAndStatusIn(Room room, List<String> statuses);

    @Query("SELECT e.room.id FROM HousekeepingEvent e WHERE e.status IN ('PENDING', 'IN_PROGRESS')")
    List<Long> findActiveRoomIds();

}
