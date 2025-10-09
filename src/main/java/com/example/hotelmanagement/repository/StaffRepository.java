package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.Staff;
import com.example.hotelmanagement.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Long> {
    List<Staff> findAll(); // Admin
    @Query("""
            SELECT CASE WHEN COUNT(s) > 0 THEN true ELSE false END
            FROM Staff s
            JOIN s.role r
            WHERE s.user.id = :userId AND r.name = :roleName
            """)
    boolean existsByUserIdAndRoleName(@Param("userId") Long userId, @Param("roleName") String roleName);

    // Find all users assigned to a specific hotel
    @Query("""
        SELECT s.user
        FROM Staff s
        WHERE s.hotel.id = :hotelId
    """)
    List<User> findUsersByHotelId(@Param("hotelId") Long hotelId);

    // Optional: find users by hotel and role
    @Query("""
        SELECT s.user
        FROM Staff s
        WHERE s.hotel.id = :hotelId
          AND s.role.name = :roleName
    """)
    List<User> findUsersByHotelIdAndRole(
            @Param("hotelId") Long hotelId,
            @Param("roleName") String roleName
    );

    // Get all users who belong to the same hotels as a given user
    @Query("""
        SELECT DISTINCT s2.user
        FROM Staff s1
        JOIN Staff s2 ON s1.hotel.id = s2.hotel.id
        WHERE s1.user.id = :userId
    """)
    List<Staff> findUsersByHotelOf(@Param("userId") Long userId);

    @Query("""
            SELECT COUNT(s) > 0
            FROM Staff s
            WHERE s.user.id = :userId
              AND LOWER(s.role.name) = LOWER(:roleName)
            """)
    boolean existsByUserIdAndRoleNameIgnoreCase(@Param("userId") Long userId, @Param("roleName") String roleName);

    @Query("SELECT s.hotel.id FROM Staff s WHERE s.user.id = :userId")
    List<Long> findHotelIdsByUserId(@Param("userId") Long userId);

    @Query("SELECT s FROM Staff s WHERE s.hotel.id IN :hotelIds")
    List<Staff> findByHotelIdIn(@Param("hotelIds") List<Long> hotelIds);


}
