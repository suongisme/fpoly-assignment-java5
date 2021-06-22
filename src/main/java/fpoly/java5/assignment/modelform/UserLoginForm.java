package fpoly.java5.assignment.modelform;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Setter
@Getter
public class UserLoginForm {

    @NotBlank(message = "validation.userform.username")
    @Pattern(regexp = "[a-z\\_]+", message = "{validation.userform.username.regex}")
    @Length(min = 5, max = 100, message = "{validation.userform.username.length}")
    private String username;

    @NotBlank(message = "{validation.userform.password}")
    @Length(min = 5, max = 100, message = "{validation.userform.password.length}")
    private String password;
}
