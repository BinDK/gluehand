package com.mvc.service.impl;

import com.mvc.ajaxentity.ProductJ;
import com.mvc.entity.Product;
import com.mvc.repository.Product2Repository;
import com.mvc.service.Product2Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Product2ServiceImpl implements Product2Service {

    @Autowired
    Product2Repository repo;

    @Override
    public Iterable<Product> findProdJx(int id, int uidd) {
        return repo.findProdJx(id,uidd);
    }
}
