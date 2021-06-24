package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Category;
import fpoly.java5.assignment.model.Size;
import fpoly.java5.assignment.service.CategoryService;
import fpoly.java5.assignment.service.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminSizeController {

    @Autowired
    private SizeService sizeService;

    @PostMapping("/size")
    public String submit(@Valid @ModelAttribute Size size, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            return "admin-form#size";
        }
        try {
            sizeService.submit(size);
            attributes.addFlashAttribute("notify", "Thao tác thành công");
        } catch (Exception e) {
            attributes.addFlashAttribute("notify", "Thao tác thất bại");
        }
        return "redirect:/admin/resources-management#size";
    }

    @GetMapping("/size/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes attributes) {
        try {
            sizeService.delete(id);
            attributes.addFlashAttribute("notify", "Xoa thành công");
        } catch (Exception e) {
            attributes.addFlashAttribute("notify", "Xoa thất bại");
        }
        return "redirect:/admin/resources-management#size";
    }

}
