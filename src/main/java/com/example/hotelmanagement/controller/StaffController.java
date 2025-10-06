package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Staff;
import com.example.hotelmanagement.service.HotelService;
import com.example.hotelmanagement.service.RoleService;
import com.example.hotelmanagement.service.StaffService;
import com.example.hotelmanagement.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private final StaffService staffService;
    @Autowired
    private final UserService userService;
    @Autowired
    private final RoleService roleService;
    @Autowired
    private final HotelService hotelService;

    /**
     * LIST ALL STAFF
     */
    @GetMapping
    public String listStaff(Model model) {
        List<Staff> staffList = staffService.findAllStaffs();
        model.addAttribute("staffList", staffList);
        return "staffs/staffs_list";
    }

    /**
     * SHOW CREATE FORM
     */
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("staff", new Staff());
        model.addAttribute("users", userService.findAll());
        model.addAttribute("roles", roleService.findAll());
        model.addAttribute("hotels", hotelService.findAllHotels());
        return "staffs/staffs_form";
    }

    /**
     * CREATE NEW STAFF
     */
    @PostMapping("/create")
    public String createStaff(@ModelAttribute Staff staff) {
        staffService.saveStaff(staff);
        return "redirect:/staffs/staffs_list";
    }

    /**
     * SHOW EDIT FORM
     */
    @GetMapping("/edit/{id}")
    public String editStaff(@PathVariable Long id, Model model) {
        staffService.findStaffById(id).ifPresent(staff -> {
            model.addAttribute("staff", staff);
            model.addAttribute("users", userService.findAll());
            model.addAttribute("roles", roleService.findAll());
            model.addAttribute("hotels", hotelService.findAllHotels());
        });
        return "staffs/staffs_form";
    }

    /**
     * UPDATE STAFF
     */
    @PostMapping("/update")
    public String updateStaff(@ModelAttribute Staff staff) {
        staffService.saveStaff(staff);
        return "redirect:/staffs/staffs_list";
    }

    /**
     * DELETE STAFF
     */
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteStaff(@PathVariable Long id) {
        try {
            staffService.deleteStaff(id);
            return ResponseEntity.ok().build(); // 200 OK on success
        } catch (DataIntegrityViolationException e) {
            // return 409 Conflict
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
