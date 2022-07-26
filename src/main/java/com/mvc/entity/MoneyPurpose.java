package com.mvc.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "money_purpose")
@Data
public class MoneyPurpose {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "money_purpose_id", nullable = false)
    private Integer id;

    @Column(name = "status_name", nullable = false)
    private String statusName;

    @OneToMany(mappedBy = "moneyPurpose")
    private Set<History> histories = new LinkedHashSet<>();

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}