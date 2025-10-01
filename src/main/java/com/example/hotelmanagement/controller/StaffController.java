package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Staff;
import com.example.hotelmanagement.repository.HotelRepository;
import com.example.hotelmanagement.repository.RoleRepository;
import com.example.hotelmanagement.repository.StaffRepository;
import com.example.hotelmanagement.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    /**
     * LIST ALL STAFF
     */
    @GetMapping
    public String listStaff(Model model) {
        List<Staff> staffList = staffRepository.findAll();
        model.addAttribute("staffList", staffList);
        return "staffs/staffs_list";
    }

    /**
     * SHOW CREATE FORM
     */
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("staff", new Staff());
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("roles", roleRepository.findAll());
        model.addAttribute("hotels", hotelRepository.findAll());
        return "staffs/staffs_form";
    }

    /**
     * CREATE NEW STAFF
     */
    @PostMapping("/create")
    public String createStaff(@ModelAttribute Staff staff) {
        staffRepository.save(staff);
        return "redirect:/staffs/staffs_list";
    }

    /**
     * SHOW EDIT FORM
     */
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

    /**
     * UPDATE STAFF
     */
    @PostMapping("/update")
    public String updateStaff(@ModelAttribute Staff staff) {
        staffRepository.save(staff);
        return "redirect:/staffs/staffs_list";
    }

    /**
     * DELETE STAFF
     */
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteStaff(@PathVariable Long id) {
        try {
            staffRepository.deleteById(id);
            return ResponseEntity.ok().build(); // 200 OK on success
        } catch (DataIntegrityViolationException e) {
            // return 409 Conflict
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
