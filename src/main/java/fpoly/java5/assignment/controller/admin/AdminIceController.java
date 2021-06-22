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

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminIceController {

    @Autowired
    private IceService iceService;

    @PostMapping("/ice")
    public String submit(@Valid @ModelAttribute Ice ice, BindingResult result) {

        if (result.hasErrors()) {
            return "admin-form#ice";
        }

        iceService.submit(ice);
        return "redirect:/admin/resources-management#ice";
    }

    @GetMapping("/ice/{id}")
    public String delete(@PathVariable Long id) {
        iceService.delete(id);
        return "redirect:/admin/resources-management#ice";
    }

}
