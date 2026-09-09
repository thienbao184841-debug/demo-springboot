package com.tuihocweb.demo_springboot.service.impl;

import com.tuihocweb.demo_springboot.entity.Category;
import com.tuihocweb.demo_springboot.repository.CategoryRepository;
import com.tuihocweb.demo_springboot.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Optional<Category> findById(int id) {
        return categoryRepository.findById(id);
    }

    @Override
    public Category save(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public void deleteById(int id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public List<Category> search(String keyword) {
        return categoryRepository.findByCateNameContainingIgnoreCase(keyword);
    }
}
