package com.example.hotelmanagement.service;

import com.example.hotelmanagement.entity.Role;
import com.example.hotelmanagement.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    public RoleRepository roleRepository;

    public List<Role> findAll() {
        return roleRepository.findAll();
    }
}
