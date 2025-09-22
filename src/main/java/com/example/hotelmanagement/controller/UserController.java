package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.User;
import com.example.hotelmanagement.repository.RoleRepository;
import com.example.hotelmanagement.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users/users_list")
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "users/users_list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("roles", roleRepository.findAll());
        return "users/users_form";
    }

    @PostMapping("/create")
    public String createUser(@ModelAttribute User user) {
        userRepository.save(user);
        return "redirect:/users/users_list";
    }

    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable Long id, Model model) {
        userRepository.findById(id).ifPresent(user -> {
            model.addAttribute("user", user);
            model.addAttribute("roles", roleRepository.findAll());
        });
        return "users/users_form";
    }

    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user) {
        userRepository.save(user);
        return "redirect:/users/users_list";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userRepository.deleteById(id);
        return "redirect:/users/users_list";
    }
}
