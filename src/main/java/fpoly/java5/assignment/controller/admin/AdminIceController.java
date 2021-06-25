package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Category;
import fpoly.java5.assignment.model.Ice;
import fpoly.java5.assignment.service.CategoryService;
import fpoly.java5.assignment.service.IceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminIceController {

    @Autowired
    private IceService iceService;

    @PostMapping("/ice")
    public String submit(@Valid @ModelAttribute Ice ice, BindingResult result, RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "admin-form";
        }

        try {
            iceService.submit(ice);
            redirectAttributes.addFlashAttribute("notify", "Thao tác thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("notify", "Thao tác thất bại!");
        }

        return "redirect:/admin/resources-management#ice";
    }

    @GetMapping("/ice/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {

        try {
            iceService.delete(id);
            redirectAttributes.addFlashAttribute("notify", "Xóa thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("notify", "Xóa thất bại!");
        }

        return "redirect:/admin/resources-management#ice";
    }

}
