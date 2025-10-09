package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.HousekeepingEvent;
import com.example.hotelmanagement.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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

    // Admins: All events
    List<HousekeepingEvent> findAll();

    // For Managers/Staff: load events from their assigned hotels (via Room → Hotel)
    @Query("""
        SELECT e
        FROM HousekeepingEvent e
        WHERE e.room.hotel IN (
            SELECT s.hotel FROM Staff s WHERE s.user.id = :userId
        )
    """)
    List<HousekeepingEvent> findByUserHotels(@Param("userId") Long userId);

    @Query("""
        SELECT h FROM HousekeepingEvent h
        JOIN h.room r
        WHERE r.hotel.id IN :hotelIds
    """)
    List<HousekeepingEvent> findByHotelIdIn(@Param("hotelIds") List<Long> hotelIds);

    @Query("""
    SELECT h FROM HousekeepingEvent h
    JOIN h.room r
    JOIN ReservationLine rl ON rl.room.id = r.id
    JOIN rl.reservation res
    WHERE res.customer.id = :customerId
""")
    List<HousekeepingEvent> findByCustomerId(@Param("customerId") Long customerId);



}
