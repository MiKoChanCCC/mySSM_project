package com.ncyysf.service.impl;

import com.ncyysf.entity.Product;
import com.ncyysf.mapper.ProductMapper;
import com.ncyysf.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    @Transactional
    public void addProduct(Product product) {
        productMapper.insert(product);
    }

    @Override
    @Transactional
    public void deleteProduct(Long id) {
        productMapper.deleteById(id);
    }

    @Override
    @Transactional
    public void updateProduct(Product product) {
        productMapper.update(product);
    }

    @Override
    public Product getProductById(Long id) {
        return productMapper.selectById(id);
    }

    @Override
    public List<Product> getAllProducts() {
        return productMapper.selectAll();
    }
}
