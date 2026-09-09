package com.tuihocweb.demo_springboot.service;

import com.tuihocweb.demo_springboot.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    List<User> findAll();
    Optional<User> findById(int id);
    User save(User user);
    void deleteById(int id);
    List<User> search(String keyword);
}
