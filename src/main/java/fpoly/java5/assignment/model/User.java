package fpoly.java5.assignment.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "validation.user.username")
    @Pattern(regexp = "[[a-z]\\_]+", message = "validation.user.username.regex")
    @Length(min = 6, max = 100, message = "{validation.user.username.length}")
    private String username;

    @NotBlank(message = "validation.user.password")
    @Length(min = 8, message = "{validation.user.password.length}")
    private String password;

    @NotBlank(message = "validation.user.address")
    private String address;

    @NotBlank(message = "validation.user.mobile")
    private String mobile;

    @NotBlank(message = "validation.user.email")
    @Pattern(regexp = "^[a-z]\\w+@[a-z]+(\\.[a-z]+){1,2}", message = "validation.user.email.regex")
    private String email;

    private String role;
    private boolean active;
}
