package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.entity.Room;
import com.example.hotelmanagement.entity.RoomType;
import com.example.hotelmanagement.repository.HotelRepository;
import com.example.hotelmanagement.repository.RoomRepository;
import com.example.hotelmanagement.repository.RoomTypeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/rooms/rooms_list")
@RequiredArgsConstructor
public class RoomController {

    private final RoomRepository roomRepository;
    private final RoomTypeRepository roomTypeRepository;
    private final HotelRepository hotelRepository;

    /**
     * LIST ALL ROOMS
     */
    @GetMapping
    public String listRooms(Model model) {
        List<Room> rooms = roomRepository.findAll();
        model.addAttribute("rooms", rooms);
        return "rooms/rooms_list";
    }

    /**
     * SHOW CREATE FORM
     */
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        Room room = new Room();
        room.setHotel(new Hotel()); // avoid null hotel in template
        room.setRoomType(new RoomType()); // avoid null roomType in template
        model.addAttribute("room", room);
        model.addAttribute("roomTypes", roomTypeRepository.findAll());
        model.addAttribute("hotels", hotelRepository.findAll());
        return "rooms/rooms_form";
    }

    /**
     * CREATE ROOM
     */
    @PostMapping("/create")
    public String createRoom(@ModelAttribute Room room, RedirectAttributes redirectAttributes) {

        boolean exists = roomRepository.findByRoomNumberAndHotelId(
                room.getRoomNumber(), room.getHotel().getId()
        ).isPresent();


        // Fetch full entities from IDs
        Hotel hotel = hotelRepository.findById(room.getHotel().getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid Hotel Id:" + room.getHotel().getId()));
        RoomType roomType = roomTypeRepository.findById(room.getRoomType().getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid RoomType Id:" + room.getRoomType().getId()));

        if (exists) {
            redirectAttributes.addFlashAttribute("error",
                    "Room number: " + room.getRoomNumber() + " already exists for this Hotel : " + hotel.getName() +
                            ", Address: " + hotel.getAddress() + ", Phone: " + hotel.getPhone());
            return "redirect:/rooms/rooms_list/create";
        }
        room.setHotel(hotel);
        room.setRoomType(roomType);

        roomRepository.save(room);
        return "redirect:/rooms/rooms_list";
    }

    /**
     * SHOW EDIT FORM
     */
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Room room = roomRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Room Id:" + id));
        // Initialize nested objects if null
        if (room.getHotel() == null) room.setHotel(new Hotel());
        if (room.getRoomType() == null) room.setRoomType(new RoomType());
        model.addAttribute("room", room);
        model.addAttribute("roomTypes", roomTypeRepository.findAll());
        model.addAttribute("hotels", hotelRepository.findAll());
        return "rooms/rooms_form";
    }

    @PostMapping("/update")
    public String updateRoom(@ModelAttribute Room room) {
        Room existingRoom = roomRepository.findById(room.getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid Room Id"));

        // Update fields
        existingRoom.setRoomNumber(room.getRoomNumber());
        existingRoom.setFloor(room.getFloor());
        existingRoom.setStatus(room.getStatus());

        Hotel hotel = hotelRepository.findById(room.getHotel().getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid Hotel Id"));
        existingRoom.setHotel(hotel);

        RoomType roomType = roomTypeRepository.findById(room.getRoomType().getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid RoomType Id"));
        existingRoom.setRoomType(roomType);

        roomRepository.save(existingRoom); // saves update instead of creating new
        return "redirect:/rooms/rooms_list";
    }

    /**
     * DELETE ROOM
     */
    @GetMapping("/delete/{id}")
    public String deleteRoom(@PathVariable Long id) {
        Room room = roomRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Room Id:" + id));
        roomRepository.delete(room);
        return "redirect:/rooms/rooms_list";
    }
}
