package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {
    Optional<Room> findByRoomNumberAndHotelId(String roomNumber, Long hotelId);

    void deleteById(Long id);

    List<Room> findAll(); // Admin

    @Query("""
        SELECT r FROM Room r
        JOIN Staff s ON s.hotel.id = r.hotel.id
        WHERE s.user.id = :userId
    """)
    List<Room> findByUserHotels(@Param("userId") Long userId);

    // Rooms for a customer (based on reservations)
    @Query("""
        SELECT DISTINCT r FROM Room r
        JOIN ReservationLine rl ON rl.room.id = r.id
        JOIN rl.reservation res
        WHERE res.customer.id = :customerId
    """)
    List<Room> findRoomsByCustomerId(@Param("customerId") Long customerId);

    // Rooms for hotels (for staff/manager)
    List<Room> findByHotelIdIn(List<Long> hotelIds);
}
