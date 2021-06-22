package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Topping;
import fpoly.java5.assignment.service.IceService;
import fpoly.java5.assignment.service.SizeService;
import fpoly.java5.assignment.service.SugarService;
import fpoly.java5.assignment.service.ToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminResourceController {

    @Autowired
    private IceService iceService;

    @Autowired
    private ToppingService toppingService;

    @Autowired
    private SizeService sizeService;

    @Autowired
    private SugarService sugarService;

    @GetMapping("/resources-management")
    public String resourceHome(Model model) {
        model.addAttribute("ices", iceService.findAll());
        model.addAttribute("sizes", sizeService.findAll());
        model.addAttribute("sugars", sugarService.findAll());
        model.addAttribute("toppings", toppingService.findAll());
        return "resource-management";
    }

}
