package com.example.hotelmanagement.controller;

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
    HotelService hotelService = new HotelService();

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
