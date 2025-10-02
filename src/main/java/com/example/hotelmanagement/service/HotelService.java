package com.example.hotelmanagement.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.hotelmanagement.entity.Hotel;
import com.example.hotelmanagement.repository.HotelRepository;

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

    // Find hotel for pagination and searching
    public Page<Hotel> findByNameContainingIgnoreCaseOrAddressContainingIgnoreCase(String name, String address, Pageable pageable) {
    	return hotelRepository.findByNameContainingIgnoreCaseOrAddressContainingIgnoreCase(
                name, address, pageable);
	}

    // Returns the total number of hotels
    public long count() {
		 return hotelRepository.count(); // Repository provides count()
	}

}
