package com.example.hotelmanagement.entity;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserRoleId implements Serializable {   // <-- make it public
    private Long userId;
    private Long roleId;
}
