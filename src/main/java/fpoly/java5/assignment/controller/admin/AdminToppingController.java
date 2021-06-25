package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Topping;
import fpoly.java5.assignment.service.ToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminToppingController {

    @Autowired
    private ToppingService toppingService;

    @PostMapping("/topping")
    public String submit(@Valid @ModelAttribute Topping topping, BindingResult result, RedirectAttributes attributes) {

        if (result.hasErrors()) {
            return "admin-form";
        }
        try {
            toppingService.submit(topping);
            attributes.addFlashAttribute("notify", "Thao tác thành công");
        } catch (Exception e) {
            attributes.addFlashAttribute("notify", "Thao tác thất bại");
        }
        return "redirect:/admin/resources-management#topping";
    }

    @GetMapping("/topping/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            toppingService.delete(id);
            redirectAttributes.addFlashAttribute("notify", "Xóa thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("notify", "Xóa thất bại");
        }
        return "redirect:/admin/resources-management#topping";
    }

}
