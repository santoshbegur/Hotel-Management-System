package com.example.hotelmanagement.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hotelmanagement.entity.RoomType;
import com.example.hotelmanagement.repository.RoomTypeRepository;

@Service
public class RoomTypeService {
	@Autowired
	public RoomTypeRepository roomTypeRepository;

	public List<RoomType> findByHotelId(Long hotelId) {
        return roomTypeRepository.findByHotelId(hotelId);
    }
	
	public Optional<RoomType> findById(Long id) {
	    return roomTypeRepository.findById(id);
	}

}
