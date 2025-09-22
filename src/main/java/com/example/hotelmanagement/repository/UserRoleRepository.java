package com.example.hotelmanagement.repository;

import com.example.hotelmanagement.entity.UserRole;
import com.example.hotelmanagement.entity.UserRoleId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, UserRoleId> {
}
