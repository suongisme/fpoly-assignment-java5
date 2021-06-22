package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.User;
import fpoly.java5.assignment.service.UserService;
import fpoly.java5.assignment.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

    @Autowired private UserService userService;

    @GetMapping("/user")
    public String userManagement(Model model, @RequestParam(defaultValue = "1") Integer admin_page, @RequestParam(defaultValue = "1") Integer user_id) {
        Page<User> adminAll = userService.findAllAdmin(admin_page);
        model.addAttribute("admins", adminAll.getContent());
        model.addAttribute("adminPages", PageUtils.getPages(adminAll.getTotalPages()));

        Page<User> userAll = userService.findAllUser(user_id);
        model.addAttribute("users", userAll.getContent());
        model.addAttribute("userPages", PageUtils.getPages(userAll.getTotalPages()));

        return "user-management";
    }

    @GetMapping("/user/disable/{id}")
    public String disable(@PathVariable Long id) {
        userService.disable(id);

        return "redirect:/admin/user";
    }

    @GetMapping("/user/enable/{id}")
    public String enable(@PathVariable Long id) {
        userService.enable(id);

        return "redirect:/admin/user";
    }

}
