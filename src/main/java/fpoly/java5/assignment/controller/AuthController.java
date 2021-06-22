package fpoly.java5.assignment.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @GetMapping("/login")
    public String showFormLogin(Model model) {

        if (session.getAttribute("login") != null) {

            return "redirect:/home";
        }

        model.addAttribute("userLoginForm", new UserLoginForm());
        return "login";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute UserLoginForm userLoginForm, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return  "login";
        }

        User login = userService.login(userLoginForm);

        if (login == null) {
            model.addAttribute("notify", "ten dang nhap hoac tai khoan sai");
            return "login";
        }

        if (!login.isActive()) {
            model.addAttribute("notify", "tai khoan dang bi khoa");
            return "login";
        }

        session.setAttribute("login", login);
        return "redirect:/order";
    }

    @GetMapping("/logout")
    public String logout() {
        session.removeAttribute("login");
        return "redirect:/home";
    }
}
