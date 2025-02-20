package com.example.demo.user;

import lombok.*;
import jakarta.persistence.*;

@Data
@Entity
@Table(name = "app_users",
        uniqueConstraints = {@UniqueConstraint(columnNames = "username")})
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String username;

    @Column
    private Long score;

}
