package fpoly.java5.assignment.controller;

import fpoly.java5.assignment.constant.Constant;
import fpoly.java5.assignment.model.User;
import fpoly.java5.assignment.service.MailService;
import fpoly.java5.assignment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import javax.validation.Valid;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    private MailService mailService;

    @GetMapping("/register")
    public String showForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute User user, BindingResult result) throws MessagingException {

        if (result.hasErrors()) {
            return "register";
        }

        mailService.sendTo(user.getEmail(), Constant.EMAIL_SUBJECT_REGISTER_USER, Constant.EMAIL_CONTENT_REGISTER_USER);
        userService.save(user);

        return "redirect:/login";
    }
}
