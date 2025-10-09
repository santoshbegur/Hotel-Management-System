package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.security.service.model.CustomUserDetails;
import com.example.hotelmanagement.service.HotelDataService;
import com.example.hotelmanagement.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class DashboardController {
    @Autowired
    HotelService hotelService = new HotelService();
    @Autowired
    HotelDataService hotelDataService;

    @GetMapping("/index")
    public String dashboard(Model model, Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

        Set<String> roleNames = userDetails.getAuthorities()
                .stream()
                .map(a -> a.getAuthority().replace("ROLE_", ""))
                .collect(Collectors.toSet());


        List<Hotel> hotels = hotelDataService.getHotelsForUser(userDetails);

        model.addAttribute("roleNames", roleNames);
        model.addAttribute("username", userDetails.getUsername());

        model.addAttribute("user", userDetails);
        model.addAttribute("hotels", hotels);
        model.addAttribute("selectedHotel", null); // or your default selection
        return "index";
    }
}
