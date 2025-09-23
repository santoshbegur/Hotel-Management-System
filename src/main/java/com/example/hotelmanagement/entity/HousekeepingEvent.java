package com.example.hotelmanagement.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "housekeeping_event")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HousekeepingEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Task status: PENDING, IN_PROGRESS, COMPLETED
    @Column(nullable = false)
    private String status;

    // Timestamp when the task was reported/created
    @Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime reportedAt;
    // Link to Room (Room already contains Hotel)
    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;
    // Staff assigned to this housekeeping task
    @ManyToOne
    @JoinColumn(name = "handled_by")
    private Staff handledBy;

    @PrePersist
    public void prePersist() {
        if (reportedAt == null) {
            reportedAt = LocalDateTime.now();
        }
    }
}
