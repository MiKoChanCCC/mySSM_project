package com.ncyysf.service;

import com.ncyysf.entity.Product;

import java.util.List;


public interface ProductService {


    void addProduct(Product product);


    void deleteProduct(Long id);


    void updateProduct(Product product);


    Product getProductById(Long id);


    List<Product> getAllProducts();
}
