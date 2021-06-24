package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.constant.Constant;
import fpoly.java5.assignment.model.User;
import fpoly.java5.assignment.modelform.UserLoginForm;
import fpoly.java5.assignment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminAuthController {

    @Autowired private HttpSession session;

    @Autowired private UserService userService;

    @GetMapping("/login")
    public String showFormLogin(Model model) {

        if (session.getAttribute("admin") != null) {
            return "redirect:/admin/home";
        }

        model.addAttribute("userLoginForm", new UserLoginForm());
        return "admin-login";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute UserLoginForm userLoginForm, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "admin-login";
        }

        User login = userService.login(userLoginForm);

        if (login == null) {
            model.addAttribute("notify", "Tài khoản hoặc mật khẩu sai");
            return "admin-login";
        }

        if (!login.getRole().equals(Constant.ADMIN_ROLE)) {
            model.addAttribute("notify", "Bạn không có quyền vào đây");
            return "admin-login";
        }

        session.setAttribute("admin", login);
        return "redirect:/admin";
    }


    @GetMapping("/logout")
    public String logout() {
        session.removeAttribute("admin");
        return "redirect:/admin/login";
    }
}
