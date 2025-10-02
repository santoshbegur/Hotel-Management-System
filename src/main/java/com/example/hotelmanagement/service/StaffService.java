package com.example.hotelmanagement.service;

import com.example.hotelmanagement.entity.Staff;
import com.example.hotelmanagement.repository.StaffRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StaffService {
    @Autowired
    private final StaffRepository staffRepository;

    public List<Staff> findAll() {
        return staffRepository.findAll();
    }

    public Optional<Staff> findById(Long id) {
        return staffRepository.findById(id);
    }

    public void saveStaff(Staff staff) {
        staffRepository.save(staff);
    }
    public void deleteStaff(Long id) {
        staffRepository.deleteById(id);
    }
}
