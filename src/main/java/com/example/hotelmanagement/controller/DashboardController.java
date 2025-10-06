package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Role;
import com.example.hotelmanagement.security.service.model.CustomUserDetails;
import com.example.hotelmanagement.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class DashboardController {
    @Autowired
    HotelService hotelService = new HotelService(); // Placeholder for actual service

    @GetMapping("/dashboard/fragment")
    public String dashboardFragment(Authentication authentication, Model model) {
        CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();

        // Add user and hotels
        model.addAttribute("user", user);
        model.addAttribute("hotels", hotelService.getHotelsForUser(user.getUser()));
        model.addAttribute("selectedHotel", null);

        // Determine primary role dynamically
        String primaryRole = user.getRoles().stream()
                .map(Role::getName) // ensure it matches your DB role names
                .findFirst()
                .orElse("GENERIC");
        model.addAttribute("role", primaryRole);

        return "fragments/dashboard/role_content :: contentFragment";
    }


    @GetMapping("/index")
    public String dashboard(Model model, Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

        Set<String> roleNames = userDetails.getAuthorities()
                .stream()
                .map(a -> a.getAuthority().replace("ROLE_", ""))
                .collect(Collectors.toSet());

        model.addAttribute("roleNames", roleNames);
        model.addAttribute("username", userDetails.getUsername());

        model.addAttribute("user", userDetails);
        model.addAttribute("hotels", hotelService.getHotelsForUser(userDetails.getUser()));
        model.addAttribute("selectedHotel", null); // or your default selection
        return "index";
    }



}
