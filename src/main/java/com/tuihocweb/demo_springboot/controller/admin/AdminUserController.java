package com.tuihocweb.demo_springboot.controller.admin;

import com.tuihocweb.demo_springboot.entity.User;
import com.tuihocweb.demo_springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

    @Autowired
    private UserService userService;

    private static final String UPLOAD_DIR = "src/main/webapp/uploads/user/";

    @GetMapping("/list")
    public String listUsers(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<User> users;
        if (keyword != null && !keyword.isEmpty()) {
            users = userService.search(keyword);
        } else {
            users = userService.findAll();
        }
        model.addAttribute("userList", users);
        model.addAttribute("keyword", keyword);
        return "admin/user/list";
    }

    @GetMapping("/add")
    public String addUserForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/add";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user,
                           @RequestParam("avatarFile") MultipartFile avatarFile) {
        if (!avatarFile.isEmpty()) {
            try {
                // Ensure directory exists
                File dir = new File(UPLOAD_DIR);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                String fileName = System.currentTimeMillis() + "_" + avatarFile.getOriginalFilename();
                Path path = Paths.get(UPLOAD_DIR + fileName);
                Files.write(path, avatarFile.getBytes());
                user.setAvatar(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (user.getId() != 0) {
            // Keep existing avatar if editing and no new file uploaded
            Optional<User> existing = userService.findById(user.getId());
            existing.ifPresent(u -> user.setAvatar(u.getAvatar()));
        }

        userService.save(user);
        return "redirect:/admin/user/list";
    }

    @GetMapping("/edit")
    public String editUserForm(@RequestParam("id") int id, Model model) {
        Optional<User> user = userService.findById(id);
        if (user.isPresent()) {
            model.addAttribute("user", user.get());
            return "admin/user/edit";
        }
        return "redirect:/admin/user/list";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("id") int id) {
        userService.deleteById(id);
        return "redirect:/admin/user/list";
    }
}
