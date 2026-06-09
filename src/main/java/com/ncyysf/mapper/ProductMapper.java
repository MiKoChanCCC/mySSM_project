package com.ncyysf.mapper;

import com.ncyysf.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface ProductMapper {


    int insert(Product product);


    int deleteById(@Param("id") Long id);


    int update(Product product);


    Product selectById(@Param("id") Long id);


    List<Product> selectAll();
}
