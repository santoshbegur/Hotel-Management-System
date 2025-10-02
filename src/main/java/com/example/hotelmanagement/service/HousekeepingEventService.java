package com.example.hotelmanagement.service;

import com.example.hotelmanagement.entity.HousekeepingEvent;
import com.example.hotelmanagement.repository.HousekeepingEventRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class HousekeepingEventService {
    @Autowired
    private final HousekeepingEventRepository housekeepingEventRepository;

    public List<HousekeepingEvent> findAll() {
        return housekeepingEventRepository.findAll();
    }

    public Optional<HousekeepingEvent> findById(Long id) {
        return housekeepingEventRepository.findById(id);
    }

    public List<Long> findActiveRoomIds() {
        return housekeepingEventRepository.findActiveRoomIds();
    }

    public void saveHousekeepingEvent(HousekeepingEvent housekeepingEvent) {
        housekeepingEventRepository.save(housekeepingEvent);
    }

    public void deleteById(Long id) {
        housekeepingEventRepository.deleteById(id);
    }
}
