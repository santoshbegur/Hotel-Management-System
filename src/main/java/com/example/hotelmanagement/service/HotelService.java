package com.example.hotelmanagement.service;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.entity.User;
import com.example.hotelmanagement.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class HotelService {

    @Autowired
    private HotelRepository hotelRepository;

    public List<Hotel> findAllHotels() {
        return hotelRepository.findAll();
    }
    
    public Optional<Hotel> findHotelById(Long id) {
        return hotelRepository.findById(id);
    }

    public Hotel saveHotel(Hotel hotel) {
        return hotelRepository.save(hotel);
    }

    public void deleteHotel(Long id) {
        hotelRepository.deleteById(id);
    }
    
    // Find hotel by all fields except the given id (for edit)
    public Optional<Hotel> findByNameAndAddressAndPhoneAndTimezoneAndIdNot(
            String name, String address, String phone, String timezone, Long id) {
    	return hotelRepository.findByNameAndAddressAndPhoneAndTimezoneAndIdNot(
                name, address, phone, timezone, id);
	}

    // Find hotel by all fields (for adding new)
    public Optional<Hotel> findByNameAndAddressAndPhoneAndTimezone(
            String name, String address, String phone, String timezone) {
    	return hotelRepository.findByNameAndAddressAndPhoneAndTimezone(
                name, address, phone, timezone);
	}

    public List<Hotel> getHotelsForUser(User user) {
        if (user.getRoles().stream().anyMatch(r -> r.getName().equals("ADMIN"))) {
            // Admin sees all hotels
            return hotelRepository.findAll();
        } else if (user.getRoles().stream().anyMatch(r -> r.getName().equals("MANAGER"))) {
            // Manager: implement logic for assigned hotels
            return hotelRepository.findByManagersContains(user);
        } else if (user.getRoles().stream().anyMatch(r -> r.getName().equals("RECEPTIONIST")
                || r.getName().equals("FRONT_DESK")
                || r.getName().equals("HOUSEKEEPING"))) {
            // Staff: only assigned hotel
            return hotelRepository.findByStaffContains(user);
        } else {
            return List.of(); // Customers or unassigned
        }
    }

}
