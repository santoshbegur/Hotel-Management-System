package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.HousekeepingEvent;
import com.example.hotelmanagement.entity.Room;
import com.example.hotelmanagement.entity.Staff;
import com.example.hotelmanagement.repository.HousekeepingEventRepository;
import com.example.hotelmanagement.repository.RoomRepository;
import com.example.hotelmanagement.repository.StaffRepository;
import lombok.RequiredArgsConstructor;
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

    private final HousekeepingEventRepository housekeepingEventRepository;
    private final RoomRepository roomRepository;
    private final StaffRepository staffRepository;

    // List all housekeeping events
    @GetMapping
    public String listEvents(Model model) {
        model.addAttribute("events", housekeepingEventRepository.findAll());
        return "housekeeping/housekeeping_list";
    }

    // Show create form
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("housekeepingEvent", new HousekeepingEvent());
        model.addAttribute("rooms", roomRepository.findAll());
        model.addAttribute("staffList", staffRepository.findAll());
        model.addAttribute("activeRoomIds", housekeepingEventRepository.findActiveRoomIds());
        return "housekeeping/housekeeping_form";
    }

    // Save new housekeeping event
    @PostMapping("/create")
    public String createEvent(@ModelAttribute HousekeepingEvent housekeepingEvent) {
        loadRoomAndStaff(housekeepingEvent);
        housekeepingEvent.setReportedAt(LocalDateTime.now());
        housekeepingEventRepository.save(housekeepingEvent);
        return "redirect:/housekeeping/housekeeping_list";
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        HousekeepingEvent event = housekeepingEventRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid event Id: " + id));
        model.addAttribute("housekeepingEvent", event);
        model.addAttribute("rooms", roomRepository.findAll());
        model.addAttribute("staffList", staffRepository.findAll());
        model.addAttribute("activeRoomIds", housekeepingEventRepository.findActiveRoomIds()
                .stream().filter(rid -> !rid.equals(event.getRoom().getId())).toList());
        return "housekeeping/housekeeping_form";
    }

    // Save update
    @PostMapping("/update/{id}")
    public String updateEvent(@PathVariable Long id, @ModelAttribute HousekeepingEvent housekeepingEvent) {
        HousekeepingEvent existingEvent = housekeepingEventRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Event not found"));
        loadRoomAndStaffForUpdate(existingEvent, housekeepingEvent);
        housekeepingEventRepository.save(existingEvent);
        return "redirect:/housekeeping/housekeeping_list";
    }

    // Delete item
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteEvent(@PathVariable Long id) {
        try {
            housekeepingEventRepository.deleteById(id);
            return ResponseEntity.ok().build();
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // --- Helper methods ---

    private void loadRoomAndStaff(HousekeepingEvent event) {
        if (event.getRoom() == null || event.getRoom().getId() == null) {
            throw new RuntimeException("Room is required");
        }
        Room room = roomRepository.findById(event.getRoom().getId())
                .orElseThrow(() -> new RuntimeException("Room not found"));
        event.setRoom(room);

        if (event.getHandledBy() != null && event.getHandledBy().getId() != null) {
            Staff staff = staffRepository.findById(event.getHandledBy().getId())
                    .orElseThrow(() -> new RuntimeException("Staff not found"));
            event.setHandledBy(staff);
        }
    }

    private void loadRoomAndStaffForUpdate(HousekeepingEvent existingEvent, HousekeepingEvent updatedEvent) {
        // Load Room
        if (updatedEvent.getRoom() == null || updatedEvent.getRoom().getId() == null) {
            throw new RuntimeException("Room must be selected");
        }
        Room room = roomRepository.findById(updatedEvent.getRoom().getId())
                .orElseThrow(() -> new RuntimeException("Room not found"));
        existingEvent.setRoom(room);

        // Load Staff
        if (updatedEvent.getHandledBy() != null && updatedEvent.getHandledBy().getId() != null) {
            Staff staff = staffRepository.findById(updatedEvent.getHandledBy().getId())
                    .orElseThrow(() -> new RuntimeException("Staff not found"));
            existingEvent.setHandledBy(staff);
        } else {
            existingEvent.setHandledBy(null);
        }

        // Status
        existingEvent.setStatus(updatedEvent.getStatus());
    }
}

