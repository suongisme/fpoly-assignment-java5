package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Topping;
import fpoly.java5.assignment.service.ToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminToppingController {

    @Autowired
    private ToppingService toppingService;

    @PostMapping("/topping")
    public String submit(@Valid @ModelAttribute Topping topping, BindingResult result) {

        if (result.hasErrors()) {
            return "admin-form#topping";
        }
        toppingService.submit(topping);
        return "redirect:/admin/resources-management#topping";
    }

    @GetMapping("/topping/{id}")
    public String delete(@PathVariable Long id) {
        toppingService.delete(id);
        return "redirect:/admin/resources-management#topping";
    }

}
