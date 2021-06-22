package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Category;
import fpoly.java5.assignment.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminCategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/category-management")
    public String category(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        return "category-management";
    }

    @PostMapping("/category")
    public String submit(@Valid @ModelAttribute Category category, BindingResult result) {

        if (result.hasErrors()) {
            return "admin-form#category";
        }

        categoryService.submit(category);
        return "redirect:/admin/category-management";
    }

    @GetMapping("/category/{id}")
    public String delete(@PathVariable Long id) {
        categoryService.delete(id);
        return "redirect:/admin/category-management";
    }

}
