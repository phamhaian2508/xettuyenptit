package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "user")
@Getter
@Setter
public class UserEntity extends BaseEntity {
    private static final long serialVersionUID = -4988455421375043688L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", nullable = false, unique = true)
    private String userName;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "middle_name")
    private String middleName;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "phone")
    private String phone;

    @Column(name = "gender")
    private String gender;

    @Column(name = "date_of_birth")
    private String dateOfBirth;

    @Column(name = "identity_number")
    private String identityNumber;

    @Column(name = "identity_issue_date")
    private String identityIssueDate;

    @Column(name = "identity_issue_place")
    private String identityIssuePlace;

    @Column(name = "permanent_province")
    private String permanentProvince;

    @Column(name = "permanent_district")
    private String permanentDistrict;

    @Column(name = "permanent_ward")
    private String permanentWard;

    @Column(name = "permanent_address")
    private String permanentAddress;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "role_id", nullable = false))
    private List<RoleEntity> roles = new ArrayList<>();

    @Transient
    private String fullName;

    public String getFullName() {
        String middle = middleName != null ? middleName.trim() : "";
        String first = firstName != null ? firstName.trim() : "";
        String combined = (middle + " " + first).trim();
        return combined;
    }

    public void setFullName(String fullName) {
        if (fullName == null) {
            return;
        }
        String normalized = fullName.trim().replaceAll("\\s+", " ");
        if (normalized.isEmpty()) {
            return;
        }
        int lastSpace = normalized.lastIndexOf(' ');
        if (lastSpace > 0) {
            this.middleName = normalized.substring(0, lastSpace);
            this.firstName = normalized.substring(lastSpace + 1);
        } else {
            this.middleName = "";
            this.firstName = normalized;
        }
    }

}
