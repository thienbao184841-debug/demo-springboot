package com.tuihocweb.demo_springboot.service;

import com.tuihocweb.demo_springboot.entity.Category;

import java.util.List;
import java.util.Optional;

public interface CategoryService {
    List<Category> findAll();
    Optional<Category> findById(int id);
    Category save(Category category);
    void deleteById(int id);
    List<Category> search(String keyword);
}
