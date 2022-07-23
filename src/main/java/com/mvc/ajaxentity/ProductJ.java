package com.mvc.ajaxentity;

import com.mvc.entity.User;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Date;
@AllArgsConstructor
@NoArgsConstructor
public class ProductJ {
    private Integer id;
    private User seller;
    private String product_name;
    private Double price_minium;
    private Date start_date;
    private Date end_date;
    private int product_status_id;
    private Double price_step;
    private int category_id;
    private int fee;


}
