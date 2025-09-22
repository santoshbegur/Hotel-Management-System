package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.HousekeepingEvent;
import com.example.hotelmanagement.repository.HousekeepingEventRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/housekeeping/housekeeping_list")
@RequiredArgsConstructor
public class HousekeepingEventController {

    private final HousekeepingEventRepository housekeepingEventRepository;

    @GetMapping
    public String listEvents(Model model) {
        List<HousekeepingEvent> events = housekeepingEventRepository.findAll();
        model.addAttribute("events", events);
        return "housekeeping/housekeeping_list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("housekeepingEvent", new HousekeepingEvent());
        return "housekeeping/housekeeping_form";
    }

    @PostMapping("/create")
    public String createEvent(@ModelAttribute HousekeepingEvent event) {
        housekeepingEventRepository.save(event);
        return "redirect:/housekeeping/housekeeping_list";
    }
}
