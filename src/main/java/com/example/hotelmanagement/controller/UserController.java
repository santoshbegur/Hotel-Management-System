package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.User;
import com.example.hotelmanagement.service.RoleService;
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
@RequestMapping("/users/users_list")
@RequiredArgsConstructor
public class UserController {
    @Autowired
    private final UserService userService;
    @Autowired
    private final RoleService roleService;

    /**
     * LIST ALL USERS
     */
    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "users/users_list";
    }

    /**
     * SHOW CREATE FORM
     */
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("roles", roleService.findAll());
        return "users/users_form";
    }

    /**
     * CREATE NEW USER
     */
    @PostMapping("/create")
    public String createUser(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/users/users_list";
    }

    /**
     * SHOW EDIT FORM
     */
    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable Long id, Model model) {
        userService.findById(id).ifPresent(user -> {
            model.addAttribute("user", user);
            model.addAttribute("roles", roleService.findAll());
        });
        return "users/users_form";
    }

    /**
     * UPDATE USER
     */
    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/users/users_list";
    }

    /**
     * DELETE USER
     */
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        try {
            userService.deleteUser(id);
            return ResponseEntity.ok().build(); // 200 OK on success
        } catch (DataIntegrityViolationException e) {
            // return 409 Conflict
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
