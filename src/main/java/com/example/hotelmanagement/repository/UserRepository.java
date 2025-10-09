package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    List<User> findAll(); // Admin

    @Query("""
        SELECT DISTINCT s.user
        FROM Staff s
        WHERE s.hotel.id IN (
            SELECT s2.hotel.id FROM Staff s2 WHERE s2.user.id = :userId
        )
    """)
    List<User> findUsersByHotelOf(@Param("userId") Long userId);
}
