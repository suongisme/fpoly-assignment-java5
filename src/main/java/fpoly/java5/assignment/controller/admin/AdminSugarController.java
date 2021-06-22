package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Sugar;
import fpoly.java5.assignment.service.SugarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminSugarController {

    @Autowired
    private SugarService sugarService;

    @PostMapping("/sugar")
    public String submit(@Valid @ModelAttribute Sugar sugar, BindingResult result) {

        if (result.hasErrors()) {
            return "admin-form#sugar";
        }
        sugarService.submit(sugar);
        return "redirect:/admin/resources-management#sugar";
    }

    @GetMapping("/sugar/{id}")
    public String delete(@PathVariable Long id) {
        sugarService.delete(id);
        return "redirect:/admin/resources-management#sugar";
    }

}
