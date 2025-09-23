package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.HousekeepingEvent;
import com.example.hotelmanagement.entity.Room;
import com.example.hotelmanagement.entity.Staff;
import com.example.hotelmanagement.repository.HousekeepingEventRepository;
import com.example.hotelmanagement.repository.RoomRepository;
import com.example.hotelmanagement.repository.StaffRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/housekeeping/housekeeping_list")
@RequiredArgsConstructor
public class HousekeepingEventController {

    private final HousekeepingEventRepository housekeepingEventRepository;
    private final RoomRepository roomRepository;
    private final StaffRepository staffRepository;

    @GetMapping
    public String listEvents(Model model) {
        model.addAttribute("events", housekeepingEventRepository.findAll());
        return "housekeeping/housekeeping_list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("housekeepingEvent", new HousekeepingEvent());
        model.addAttribute("rooms", roomRepository.findAll());
        model.addAttribute("staffList", staffRepository.findAll());
        model.addAttribute("activeRoomIds", housekeepingEventRepository.findActiveRoomIds());
        return "housekeeping/housekeeping_form";
    }

    @PostMapping("/create")
    public String createEvent(@ModelAttribute HousekeepingEvent housekeepingEvent) {

        // Check if room is selected
        Room room = housekeepingEvent.getRoom();
        if (room == null || room.getId() == null) {
            throw new RuntimeException("Room is required");
        }

        // Load full Room object from DB
        room = roomRepository.findById(room.getId())
                .orElseThrow(() -> new RuntimeException("Room not found"));
        housekeepingEvent.setRoom(room);

        // Check for existing active event
        if (housekeepingEventRepository.existsByRoomAndStatusIn(room, List.of("PENDING", "IN_PROGRESS"))) {
            throw new RuntimeException("An active housekeeping event already exists for this room.");
        }

        // Load Staff if selected
        if (housekeepingEvent.getHandledBy() != null && housekeepingEvent.getHandledBy().getId() != null) {
            Staff staff = staffRepository.findById(housekeepingEvent.getHandledBy().getId())
                    .orElseThrow(() -> new RuntimeException("Staff not found"));
            housekeepingEvent.setHandledBy(staff);
        }

        // Set timestamp
        housekeepingEvent.setReportedAt(LocalDateTime.now());

        housekeepingEventRepository.save(housekeepingEvent);
        return "redirect:/housekeeping/housekeeping_list";
    }


    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        HousekeepingEvent event = housekeepingEventRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid event Id: " + id));

        model.addAttribute("housekeepingEvent", event);
        model.addAttribute("rooms", roomRepository.findAll());
        model.addAttribute("staffList", staffRepository.findAll());
        model.addAttribute("activeRoomIds", housekeepingEventRepository.findActiveRoomIds()
                .stream().filter(rid -> !rid.equals(event.getRoom().getId())).toList());
        return "housekeeping/housekeeping_form";
    }

    @PostMapping("/update/{id}")
    public String updateEvent(@PathVariable Long id, @ModelAttribute HousekeepingEvent housekeepingEvent) {

        HousekeepingEvent existingEvent = housekeepingEventRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Event not found"));

        // Load Room
        if (housekeepingEvent.getRoom() == null || housekeepingEvent.getRoom().getId() == null) {
            throw new RuntimeException("Room must be selected");
        }
        Room room = roomRepository.findById(housekeepingEvent.getRoom().getId())
                .orElseThrow(() -> new RuntimeException("Room not found"));
        existingEvent.setRoom(room);

        // Load Staff (optional)
        if (housekeepingEvent.getHandledBy() != null && housekeepingEvent.getHandledBy().getId() != null) {
            Staff staff = staffRepository.findById(housekeepingEvent.getHandledBy().getId())
                    .orElseThrow(() -> new RuntimeException("Staff not found"));
            existingEvent.setHandledBy(staff);
        } else {
            existingEvent.setHandledBy(null);
        }

        // Status
        String newStatus = housekeepingEvent.getStatus();
        // Check for duplicate active events in this room, excluding current
        boolean duplicateExists = housekeepingEventRepository.existsByRoomAndStatusInAndIdNot(
                room, List.of("PENDING", "IN_PROGRESS"), id
        );
        if (duplicateExists && (newStatus.equals("PENDING") || newStatus.equals("IN_PROGRESS"))) {
            throw new RuntimeException("Another active housekeeping event already exists for this room");
        }
        existingEvent.setStatus(newStatus);

        // Save updated event
        housekeepingEventRepository.save(existingEvent);
        return "redirect:/housekeeping/housekeeping_list";
    }


    @GetMapping("/delete/{id}")
    public String deleteEvent(@PathVariable Long id) {
        housekeepingEventRepository.deleteById(id);
        return "redirect:/housekeeping/housekeeping_list";
    }
}
