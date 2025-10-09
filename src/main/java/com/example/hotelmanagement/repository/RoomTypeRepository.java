package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.RoomType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomTypeRepository extends JpaRepository<RoomType, Long> {
    List<RoomType> findByHotelId(Long hotelId);
    List<RoomType> findAll(); // Admin

    @Query("""
        SELECT DISTINCT rt
        FROM RoomType rt
        JOIN Room r ON r.roomType.id = rt.id
        JOIN Staff s ON s.hotel.id = r.hotel.id
        WHERE s.user.id = :userId
    """)
    List<RoomType> findByUserHotels(@Param("userId") Long userId);
}
