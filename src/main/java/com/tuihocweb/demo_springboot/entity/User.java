package com.tuihocweb.demo_springboot.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Entity
@Table(name = "[User]") // Use brackets because User is a reserved word in SQL Server
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String email;

    @Column(name = "username")
    private String userName;

    @Column(name = "fullname")
    private String fullName;

    @Column(name = "password")
    private String passWord;

    private String avatar;

    private int roleid;

    private String phone;

    @Column(name = "createddate")
    @Temporal(TemporalType.DATE)
    private Date createdDate;

    @PrePersist
    protected void onCreate() {
        if (createdDate == null) {
            createdDate = new Date();
        }
    }
}
