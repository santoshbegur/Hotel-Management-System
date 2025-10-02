package com.example.hotelmanagement.service;

import com.example.hotelmanagement.entity.Room;
import com.example.hotelmanagement.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoomService {
    @Autowired
    public RoomRepository roomRepository;

    public List<Room> findAllRooms() {
        return roomRepository.findAll();
    }

    public Optional<Room> findByRoomNumberAndHotelId(String roomNumber, Long hotelId) {
        return roomRepository.findByRoomNumberAndHotelId(roomNumber, hotelId);
    }

    public void saveRoom(Room room) {
         roomRepository.save(room);
    }

    public Optional<Room> findRoomById(Long id) {
        return roomRepository.findById(id);
    }

    public void deleteRoomById(Long id) {
         roomRepository.deleteById(id);
    }
}
