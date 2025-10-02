package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.service.HotelService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequestMapping("/hotels/hotels_list")
@RequiredArgsConstructor
public class HotelController {
    @Autowired
    private final HotelService hotelService;
  
    @GetMapping
    public String listHotels(Model model)
    {
    	model.addAttribute("hotels", hotelService.findAllHotels());
        return "hotels/hotels_list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        Hotel hotel = new Hotel();
        hotel.setTimezone("Asia/Kolkata"); // **must match the key**// **key of the zone** to preselect
        model.addAttribute("hotel", hotel);
        return "hotels/hotels_form";
    }

    @PostMapping("/create")
    public String createHotel(@ModelAttribute Hotel hotel, RedirectAttributes redirectAttributes) {
        Optional<Hotel> existing = hotelService.findByNameAndAddressAndPhoneAndTimezone(
                hotel.getName(), hotel.getAddress(), hotel.getPhone(), hotel.getTimezone());

        if (existing.isPresent()) {
            redirectAttributes.addFlashAttribute("error",
                    "Hotel already exists! Name: " + hotel.getName() +
                            ", Address: " + hotel.getAddress() +
                            ", Phone: " + hotel.getPhone() +
                            ", Timezone: " + hotel.getTimezone());
            return "redirect:/hotels/hotels_list/create";
        }
        hotelService.saveHotel(hotel);
        return "redirect:/hotels/hotels_list";
    }

    @GetMapping("/edit/{id}")
    public String editHotel(@PathVariable Long id, Model model) {
    	hotelService.findHotelById(id).ifPresent(hotel -> model.addAttribute("hotel", hotel));
        Hotel hotel = (Hotel) model.getAttribute("hotel");
        // handle not found
        if (hotel == null) {          
            return "redirect:/hotels";
        }
        model.addAttribute("hotel", hotel);
        return "hotels/hotels_form";
    }

    @PostMapping("/update")
    public String updateHotel(@ModelAttribute Hotel hotel, RedirectAttributes redirectAttributes) {
        boolean exists = hotelService
                .findByNameAndAddressAndPhoneAndTimezoneAndIdNot(
                        hotel.getName(), hotel.getAddress(), hotel.getPhone(),
                        hotel.getTimezone(), hotel.getId())
                .isPresent();

        if (exists) {
            redirectAttributes.addFlashAttribute("error", "Another hotel with same details already exists!");
            return "redirect:/hotels/hotels_list/edit/" + hotel.getId();
        }
        hotelService.saveHotel(hotel);
        return "redirect:/hotels/hotels_list";
    }

    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteHotel(@PathVariable Long id) {
        try {
            hotelService.deleteHotel(id);
            return ResponseEntity.ok().build(); // 200 OK on success
        } catch (DataIntegrityViolationException e) {
            // return 409 Conflict
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


}
