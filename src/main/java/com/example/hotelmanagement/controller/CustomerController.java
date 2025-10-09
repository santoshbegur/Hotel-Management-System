package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Customer;
import com.example.hotelmanagement.security.service.model.CustomUserDetails;
import com.example.hotelmanagement.service.CustomerService;
import com.example.hotelmanagement.service.HotelDataService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/customers/customers_list")
@RequiredArgsConstructor
public class CustomerController {
    @Autowired
    private final CustomerService customerService;
    @Autowired
    private final HotelDataService hotelDataService;

    // Return customers list fragment
    @GetMapping
    public String listCustomers(Model model) {
        // Get logged-in user details
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        List<Customer> customers = hotelDataService.getCustomersForUser(userDetails);
        model.addAttribute("customers", customers);
        return "customers/customers_list"; // return fragment
    }

    // Show empty form (create)
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "customers/customers_form"; // return fragment
    }

    // Save new customer
    @PostMapping("/create")
    @ResponseBody
    public ResponseEntity<Customer> createCustomer(@ModelAttribute Customer customer) {
        customerService.saveCustomer(customer);
        return ResponseEntity.ok().build(); // let JS reload the list
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Customer customer = customerService.getCustomerById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid customer Id:" + id));
        model.addAttribute("customer", customer);
        return "customers/customers_form"; // return fragment
    }

    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Customer customer = customerService.getCustomerById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid customer Id:" + id));
        model.addAttribute("customer", customer);
        return "customers/customers_form"; // form to edit
    }

    // Handle update
    @PostMapping("/update")
    public String updateCustomer(@ModelAttribute Customer customer) {
        customerService.saveCustomer(customer);
        return "redirect:/customers/customers_list";
    }

    // Delete customer
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteCustomer(@PathVariable Long id) {
        try {
            customerService.deleteCustomerById(id);
            return ResponseEntity.ok().build();
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
