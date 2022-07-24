package com.mvc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seller_id")
    private User seller;

    private String product_name;

    private Double price_minium;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date start_date;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date end_date;

    private Integer product_status_id;

    private Double price_step;

    private Integer category_id;

    private Integer fee;

    @Column(name = "buyer_id", nullable = true)
    private Integer buyer_id;

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    //TODO Reverse Engineering! Migrate other columns to the entity
}