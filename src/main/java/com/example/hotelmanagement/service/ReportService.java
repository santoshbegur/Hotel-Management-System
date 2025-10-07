package com.example.hotelmanagement.service;

import com.example.hotelmanagement.entity.Reservation;
import com.example.hotelmanagement.repository.ReservationRepository;
import com.example.hotelmanagement.repository.RoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ReportService {
    @Autowired
    private ReservationRepository reservationRepository;
    @Autowired
    private RoomRepository roomRepository;

    /**
     * Generate daily revenue report for a date range
     */
    public Map<LocalDate, BigDecimal> generateDailyRevenueReport(LocalDate startDate, LocalDate endDate) {
        Map<LocalDate, BigDecimal> dailyRevenue = new LinkedHashMap<>();

        LocalDate date = startDate;
        while (!date.isAfter(endDate)) {
            List<Reservation> reservations = reservationRepository.findActiveReservationsOnDate(date);

            BigDecimal totalRevenue = reservations.stream()
                    .flatMap(r -> r.getReservationLines().stream())
                    .map(line -> line.getPricePerNight()
                            .multiply(BigDecimal.valueOf(line.getNights() != null ? line.getNights() : 0)))
                    .reduce(BigDecimal.ZERO, BigDecimal::add);

            dailyRevenue.put(date, totalRevenue);
            date = date.plusDays(1);
        }
        return dailyRevenue;
    }

    /**
     * Generate daily occupancy report for a date range
     */
    public Map<LocalDate, Double> generateDailyOccupancyReport(LocalDate start, LocalDate end) {
        List<Reservation> reservations = reservationRepository.findReservationsBetweenDates(start, end);
        long totalRooms = roomRepository.count();

        Map<LocalDate, Double> dailyOccupancy = new LinkedHashMap<>();

        for (LocalDate date = start; !date.isAfter(end); date = date.plusDays(1)) {
            LocalDate finalDate = date;
            long occupiedRooms = reservations.stream()
                    .filter(r -> !r.getCheckOutDate().isBefore(finalDate) && !r.getCheckInDate().isAfter(finalDate))
                    .flatMap(r -> r.getReservationLines().stream())
                    .map(line -> line.getRoom().getId())
                    .distinct()
                    .count();

            double occupancyRate = (double) occupiedRooms / totalRooms * 100.0;
            dailyOccupancy.put(date, occupancyRate);
        }
        return dailyOccupancy;
    }
}
