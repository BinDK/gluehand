package com.mvc.entity;

import javax.persistence.*;

@Entity
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @Column(name = "payment_percentage", nullable = true)
    private Double paymentPercentage;

    @Column(name = "fee_percentage", nullable = true)
    private Double feePercentage;

    public Double getFeePercentage() {
        return feePercentage;
    }

    public void setFeePercentage(Double feePercentage) {
        this.feePercentage = feePercentage;
    }

    public Double getPaymentPercentage() {
        return paymentPercentage;
    }

    public void setPaymentPercentage(Double paymentPercentage) {
        this.paymentPercentage = paymentPercentage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}