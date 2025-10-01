package com.example.hotelmanagement.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//Entity Highlights
//@Entity and @Table with a unique constraint on (name, address, phone, timezone) is good for avoiding duplicate hotels.
//@Data from Lombok generates getters, setters, equals, hashCode, and toString.
//@Builder allows fluent object creation.
//createdAt column with TIMESTAMP DEFAULT CURRENT_TIMESTAMP ensures automatic timestamp insertion on creation.

@Entity
@Table(
        name = "hotel",
        uniqueConstraints = @UniqueConstraint(columnNames = {"name", "address", "phone", "timezone"})
)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Hotel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 191)
    private String name;

    @Column(columnDefinition = "TEXT", length = 191)
    private String address;

    @Column(length = 50)
    private String phone;

    @Column(length = 100)
    private String timezone;

    @Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private java.time.LocalDateTime createdAt;
}
