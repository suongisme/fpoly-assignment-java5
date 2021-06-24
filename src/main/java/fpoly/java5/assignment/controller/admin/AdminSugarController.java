package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Sugar;
import fpoly.java5.assignment.service.SugarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminSugarController {

    @Autowired
    private SugarService sugarService;

    @PostMapping("/sugar")
    public String submit(@Valid @ModelAttribute Sugar sugar, BindingResult result, RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "admin-form#sugar";
        }
        try {
            sugarService.submit(sugar);
            redirectAttributes.addFlashAttribute("notify", "Thao tác thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("notify", "Thao tác thất bại");
        }
        return "redirect:/admin/resources-management#sugar";
    }

    @GetMapping("/sugar/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes attributes) {
        try {
            sugarService.delete(id);
            attributes.addFlashAttribute("notify", "Xóa thanhf công");
        } catch (Exception e) {
            attributes.addFlashAttribute("notify", "Xóa thất bại");
        }
        return "redirect:/admin/resources-management#sugar";
    }

}
