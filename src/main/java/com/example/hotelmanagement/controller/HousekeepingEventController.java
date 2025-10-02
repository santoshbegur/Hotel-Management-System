package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.HousekeepingEvent;
import com.example.hotelmanagement.entity.Room;
import com.example.hotelmanagement.entity.Staff;
import com.example.hotelmanagement.service.HousekeepingEventService;
import com.example.hotelmanagement.service.RoomService;
import com.example.hotelmanagement.service.StaffService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/housekeeping/housekeeping_list")
@RequiredArgsConstructor
public class HousekeepingEventController {
    @Autowired
    private final HousekeepingEventService housekeepingEventService;
    @Autowired
    private final RoomService roomService;
    @Autowired
    private final StaffService staffService;

    // List all housekeeping events
    @GetMapping
    public String listEvents(Model model) {
        model.addAttribute("events", housekeepingEventService.findAll());
        return "housekeeping/housekeeping_list";
    }

    // Show create form
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("housekeepingEvent", new HousekeepingEvent());
        model.addAttribute("rooms", roomService.findAllRooms());
        model.addAttribute("staffList", staffService.findAll());
        model.addAttribute("activeRoomIds", housekeepingEventService.findActiveRoomIds());
        return "housekeeping/housekeeping_form";
    }

    // Save new housekeeping event
    @PostMapping("/create")
    public String createEvent(@ModelAttribute HousekeepingEvent housekeepingEvent) {
        loadRoomAndStaff(housekeepingEvent);
        housekeepingEvent.setReportedAt(LocalDateTime.now());
        housekeepingEventService.saveHousekeepingEvent(housekeepingEvent);
        return "redirect:/housekeeping/housekeeping_list";
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        HousekeepingEvent event = housekeepingEventService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid event Id: " + id));
        model.addAttribute("housekeepingEvent", event);
        model.addAttribute("rooms", roomService.findAllRooms());
        model.addAttribute("staffList", staffService.findAll());
        model.addAttribute("activeRoomIds", housekeepingEventService.findActiveRoomIds()
                .stream().filter(rid -> !rid.equals(event.getRoom().getId())).toList());
        return "housekeeping/housekeeping_form";
    }

    // Save update
    @PostMapping("/update/{id}")
    public String updateEvent(@PathVariable Long id, @ModelAttribute HousekeepingEvent housekeepingEvent) {
        HousekeepingEvent existingEvent = housekeepingEventService.findById(id)
                .orElseThrow(() -> new RuntimeException("Event not found"));
        loadRoomAndStaffForUpdate(existingEvent, housekeepingEvent);
        housekeepingEventService.saveHousekeepingEvent(existingEvent);
        return "redirect:/housekeeping/housekeeping_list";
    }

    // Delete item
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteEvent(@PathVariable Long id) {
        try {
            housekeepingEventService.deleteById(id);
            return ResponseEntity.ok().build();
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // --- Helper methods ---
    private void loadRoomAndStaff(HousekeepingEvent event) throws RuntimeException {
        if (event.getRoom() == null || event.getRoom().getId() == null) {
            throw new RuntimeException("Room is required");
        }
        Room room = roomService.findRoomById(event.getRoom().getId()).orElseThrow(()
                -> new RuntimeException("Room not found"));
        event.setRoom(room);

        if (event.getHandledBy() != null && event.getHandledBy().getId() != null) {
            Staff staff = staffService.findById(event.getHandledBy().getId())
                    .orElseThrow(() -> new RuntimeException("Staff not found"));
            event.setHandledBy(staff);
        }
    }

    private void loadRoomAndStaffForUpdate(HousekeepingEvent existingEvent, HousekeepingEvent updatedEvent) throws RuntimeException {
        // Load Room
        if (updatedEvent.getRoom() == null || updatedEvent.getRoom().getId() == null) {
            throw new RuntimeException("Room must be selected");
        }
        Room room = roomService.findRoomById(updatedEvent.getRoom().getId())
                .orElseThrow(() -> new RuntimeException("Room not found"));
        existingEvent.setRoom(room);

        // Load Staff
        if (updatedEvent.getHandledBy() != null && updatedEvent.getHandledBy().getId() != null) {
            Staff staff = staffService.findById(updatedEvent.getHandledBy().getId())
                    .orElseThrow(() -> new RuntimeException("Staff not found"));
            existingEvent.setHandledBy(staff);
        } else {
            existingEvent.setHandledBy(null);
        }

        // Status
        existingEvent.setStatus(updatedEvent.getStatus());
    }
}

