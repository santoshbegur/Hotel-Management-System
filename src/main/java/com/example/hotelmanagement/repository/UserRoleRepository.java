package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.UserRole;
import com.example.hotelmanagement.entity.UserRoleId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, UserRoleId> {
    List<UserRole> findAll();

    @Query("""
        SELECT ur
        FROM UserRole ur
        WHERE ur.user.id = :userId
    """)
    List<UserRole> findByUserId(@Param("userId") Long userId);
}
