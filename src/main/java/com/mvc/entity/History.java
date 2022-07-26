package com.mvc.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.Instant;
import java.util.Date;

@Entity
@Table(name = "history")
@Data
public class History {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "created", nullable = false)
    private Date created;

    @Column(name = "money", nullable = false)
    private Double money;

    @ManyToOne
    @JoinColumn(name = "money_purpose", nullable = false)
    private MoneyPurpose moneyPurpose;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "wallet_id")
    private Wallet wallet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id",nullable = true)
    private Product product;

}