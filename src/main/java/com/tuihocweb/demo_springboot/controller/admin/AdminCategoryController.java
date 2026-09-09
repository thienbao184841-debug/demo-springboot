package com.tuihocweb.demo_springboot.controller.admin;

import com.tuihocweb.demo_springboot.entity.Category;
import com.tuihocweb.demo_springboot.service.CategoryService;
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
@RequestMapping("/admin/category")
public class AdminCategoryController {

    @Autowired
    private CategoryService categoryService;

    private static final String UPLOAD_DIR = "src/main/webapp/uploads/category/";

    @GetMapping("/list")
    public String listCategories(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<Category> categories;
        if (keyword != null && !keyword.isEmpty()) {
            categories = categoryService.search(keyword);
        } else {
            categories = categoryService.findAll();
        }
        model.addAttribute("cateList", categories);
        model.addAttribute("keyword", keyword);
        return "admin/category/list";
    }

    @GetMapping("/add")
    public String addCategoryForm(Model model) {
        model.addAttribute("category", new Category());
        return "admin/category/add";
    }

    @PostMapping("/save")
    public String saveCategory(@ModelAttribute("category") Category category,
                               @RequestParam("iconFile") MultipartFile iconFile) {
        if (!iconFile.isEmpty()) {
            try {
                // Ensure directory exists
                File dir = new File(UPLOAD_DIR);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                String fileName = System.currentTimeMillis() + "_" + iconFile.getOriginalFilename();
                Path path = Paths.get(UPLOAD_DIR + fileName);
                Files.write(path, iconFile.getBytes());
                category.setIcons(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (category.getCateId() != 0) {
            // Keep existing icon if editing and no new file uploaded
            Optional<Category> existing = categoryService.findById(category.getCateId());
            existing.ifPresent(c -> category.setIcons(c.getIcons()));
        }

        categoryService.save(category);
        return "redirect:/admin/category/list";
    }

    @GetMapping("/edit")
    public String editCategoryForm(@RequestParam("id") int id, Model model) {
        Optional<Category> category = categoryService.findById(id);
        if (category.isPresent()) {
            model.addAttribute("category", category.get());
            return "admin/category/edit";
        }
        return "redirect:/admin/category/list";
    }

    @GetMapping("/delete")
    public String deleteCategory(@RequestParam("id") int id) {
        categoryService.deleteById(id);
        return "redirect:/admin/category/list";
    }
}
