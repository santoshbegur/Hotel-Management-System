package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.entity.Room;
import com.example.hotelmanagement.entity.RoomType;
import com.example.hotelmanagement.service.HotelService;
import com.example.hotelmanagement.service.RoomService;
import com.example.hotelmanagement.service.RoomTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/rooms/rooms_list")
@RequiredArgsConstructor
public class RoomController {
    @Autowired
    private final RoomService roomService;
    @Autowired
    private final RoomTypeService roomTypeService;
    @Autowired
    private final HotelService hotelService;

    /**
     * LIST ALL ROOMS
     */
    @GetMapping
    public String listRooms(Model model) {
        List<Room> rooms = roomService.findAllRooms();
        model.addAttribute("rooms", rooms);
        return "rooms/rooms_list";
    }

    /**
     * SHOW CREATE FORM
     */
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        Room room = new Room();
        room.setHotel(new Hotel());
        room.setRoomType(new RoomType());

        List<Hotel> hotels = hotelService.findAllHotels();
        model.addAttribute("hotels", hotels);

        // Pass only room types for the first hotel in the list
        if (!hotels.isEmpty()) {
            List<RoomType> roomTypesForHotel = roomTypeService.findByHotelId(hotels.get(0).getId());
            model.addAttribute("roomTypes", roomTypesForHotel);
        } else {
            model.addAttribute("roomTypes", List.of());
        }

        model.addAttribute("room", room);
        return "rooms/rooms_form";
    }


    /**
     * CREATE ROOM
     */
    @PostMapping("/create")
    public String createRoom(@ModelAttribute Room room, RedirectAttributes redirectAttributes) {

        boolean exists = roomService.findByRoomNumberAndHotelId(
                room.getRoomNumber(), room.getHotel().getId()
        ).isPresent();


        // Fetch full entities from IDs
        Hotel hotel = hotelService.findHotelById(room.getHotel().getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid Hotel Id:" + room.getHotel().getId()));

        RoomType roomType = roomTypeService.findById(room.getRoomType().getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid RoomType Id:" + room.getRoomType().getId()));

        if (exists) {
            redirectAttributes.addFlashAttribute("error",
                    "Room number: " + room.getRoomNumber() + " already exists for this Hotel : " + hotel.getName() +
                            ", Address: " + hotel.getAddress() + ", Phone: " + hotel.getPhone());
            return "redirect:/rooms/rooms_list/create";
        }
        room.setHotel(hotel);
        room.setRoomType(roomType);

        roomService.saveRoom(room);
        return "redirect:/rooms/rooms_list";
    }

    /**
     * SHOW EDIT FORM
     */
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Room room = roomService.findRoomById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Room Id:" + id));

        if (room.getHotel() == null) room.setHotel(new Hotel());
        if (room.getRoomType() == null) room.setRoomType(new RoomType());

        model.addAttribute("room", room);
        model.addAttribute("hotels", hotelService.findAllHotels());

        // Filter room types for the room's hotel
        List<RoomType> roomTypesForHotel = roomTypeService.findByHotelId(room.getHotel().getId());
        model.addAttribute("roomTypes", roomTypesForHotel);

        return "rooms/rooms_form";
    }

    /**
     * UPDATE ROOM
     */
    @PostMapping("/update")
    public String updateRoom(@ModelAttribute Room room) {
        Room existingRoom = roomService.findRoomById(room.getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid Room Id"));

        // Update fields
        existingRoom.setRoomNumber(room.getRoomNumber());
        existingRoom.setFloor(room.getFloor());
        existingRoom.setStatus(room.getStatus());

        Hotel hotel = hotelService.findHotelById(room.getHotel().getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid Hotel Id"));
        existingRoom.setHotel(hotel);

        RoomType roomType = roomTypeService.findById(room.getRoomType().getId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid RoomType Id"));
        existingRoom.setRoomType(roomType);

        roomService.saveRoom(existingRoom); // saves update instead of creating new
        return "redirect:/rooms/rooms_list";
    }

    /**
     * DELETE ROOM
     */
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteRoom(@PathVariable Long id) {
        try {
            roomService.deleteRoomById(id);
            return ResponseEntity.ok().build(); // 200 OK on success
        } catch (DataIntegrityViolationException e) {
            // return 409 Conflict
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
