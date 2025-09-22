package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Staff;
import com.example.hotelmanagement.repository.HotelRepository;
import com.example.hotelmanagement.repository.RoleRepository;
import com.example.hotelmanagement.repository.StaffRepository;
import com.example.hotelmanagement.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/staffs/staffs_list")
@RequiredArgsConstructor
public class StaffController {

    private final StaffRepository staffRepository;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final HotelRepository hotelRepository;

    @GetMapping
    public String listStaff(Model model) {
        List<Staff> staffList = staffRepository.findAll();
        model.addAttribute("staffList", staffList);
        return "staffs/staffs_list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("staff", new Staff());
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("roles", roleRepository.findAll());
        model.addAttribute("hotels", hotelRepository.findAll());
        return "staffs/staffs_form";
    }

    @PostMapping("/create")
    public String createStaff(@ModelAttribute Staff staff) {
        staffRepository.save(staff);
        return "redirect:/staffs/staffs_list";
    }

    @GetMapping("/edit/{id}")
    public String editStaff(@PathVariable Long id, Model model) {
        staffRepository.findById(id).ifPresent(staff -> {
            model.addAttribute("staff", staff);
            model.addAttribute("users", userRepository.findAll());
            model.addAttribute("roles", roleRepository.findAll());
            model.addAttribute("hotels", hotelRepository.findAll());
        });
        return "staffs/staffs_form";
    }

    @PostMapping("/update")
    public String updateStaff(@ModelAttribute Staff staff) {
        staffRepository.save(staff);
        return "redirect:/staffs/staffs_list";
    }

    @GetMapping("/delete/{id}")
    public String deleteStaff(@PathVariable Long id) {
        staffRepository.deleteById(id);
        return "redirect:/staffs/staffs_list";
    }
}
