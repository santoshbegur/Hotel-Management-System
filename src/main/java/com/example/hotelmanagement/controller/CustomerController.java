package com.example.hotelmanagement.controller;

import com.example.hotelmanagement.entity.Customer;
import com.example.hotelmanagement.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/customers/customers_list")
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerRepository customerRepository;

    // Return customers list fragment
    @GetMapping
    public String listCustomers(Model model) {
        model.addAttribute("customers", customerRepository.findAll());
        return "customers/customers_list :: customersList"; // return fragment
    }

    // Show empty form (create)
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "customers/customers_form :: customersForm"; // return fragment
    }

    // Save new customer
    @PostMapping("/create")
    @ResponseBody
    public ResponseEntity<?> createCustomer(@ModelAttribute Customer customer) {
        customerRepository.save(customer);
        return ResponseEntity.ok().build(); // let JS reload the list
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid customer Id:" + id));
        model.addAttribute("customer", customer);
        return "customers/customers_form :: customersForm"; // return fragment
    }

    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid customer Id:" + id));
        model.addAttribute("customer", customer);
        return "customers/customers_form"; // form to edit
    }

    // Handle update
    @PostMapping("/update")
    public String updateCustomer(@ModelAttribute Customer customer) {
        customerRepository.save(customer);
        return "redirect:/customers/customers_list";
    }

    // Delete customer
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Void> deleteCustomer(@PathVariable Long id) {
        try {
            customerRepository.deleteById(id);
            return ResponseEntity.ok().build();
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
