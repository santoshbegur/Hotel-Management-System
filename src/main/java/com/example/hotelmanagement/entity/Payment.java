package com.example.hotelmanagement.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Entity
@Table(name = "payment")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private BigDecimal amount;
    private String currency;
    private String method;
    private String status;
    @Column(name = "transaction_id", unique = true, nullable = false)
    private String transactionId;

    @ManyToOne
    @JoinColumn(name = "reservation_id")
    @JsonIgnore
    private Reservation reservation;
}
