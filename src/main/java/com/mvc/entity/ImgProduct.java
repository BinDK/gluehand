package com.mvc.entity;

import javax.persistence.*;

@Entity
@Table(name = "img_product")
public class ImgProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "img", nullable = false)
    private String img;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "productx_id", nullable = false)
    private Product productx;

    public Product getProductx() {
        return productx;
    }

    public void setProductx
            (Product product) {
        this.productx = product;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}