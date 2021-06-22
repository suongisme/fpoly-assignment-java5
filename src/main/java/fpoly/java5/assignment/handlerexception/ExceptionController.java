package fpoly.java5.assignment.handlerexception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(RuntimeException.class)
    public String error(RuntimeException rx, Model model) {
        model.addAttribute("error", rx);
        return "runtime-error";
    }

}
