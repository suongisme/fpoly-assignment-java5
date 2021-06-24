package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Category;
import fpoly.java5.assignment.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String submit(@Valid @ModelAttribute Category category, BindingResult result, RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "admin-form#category";
        }

        try {
            categoryService.submit(category);
            redirectAttributes.addFlashAttribute("notify", "Thêm loại sản phẩm thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("notify", "Thêm thất bại!");
        }

        return "redirect:/admin/category-management";
    }

    @GetMapping("/category/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes attributes) {

        try {
            categoryService.delete(id);
            attributes.addFlashAttribute("notify", "Xóa loại sản phẩm thành công");
        } catch (Exception e) {
            attributes.addFlashAttribute("notify", "Xóa thất bại");
        }

        return "redirect:/admin/category-management";
    }

}
