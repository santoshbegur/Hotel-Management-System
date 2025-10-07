package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/reports")
public class ReportController {
    @Autowired
    private ReportService reportService;

    @GetMapping("/reports_list")
    public String showReportsList() {
        return "reports/reports_list";
    }

    @GetMapping("/revenue_list")
    public String getRevenueReport(@RequestParam String startDate,
                                   @RequestParam String endDate,
                                   Model model) {
        Map<LocalDate, BigDecimal> reportData = reportService.generateDailyRevenueReport(LocalDate.parse(startDate), LocalDate.parse(endDate));
        model.addAttribute("reportData", reportData);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "reports/revenue_list";
    }

    @GetMapping("/occupancy_list")
    public String getOccupancyReport(@RequestParam String startDate,
                                     @RequestParam String endDate,
                                     Model model) {
        Map<LocalDate, Double> reportData = reportService.generateDailyOccupancyReport(LocalDate.parse(startDate), LocalDate.parse(endDate));
        model.addAttribute("reportData", reportData);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "reports/occupancy_list";
    }
}

