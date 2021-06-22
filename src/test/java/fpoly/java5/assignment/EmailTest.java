package fpoly.java5.assignment;

import org.junit.jupiter.api.Test;
import org.springframework.util.Assert;

public class EmailTest {

    String regex = "^[a-z]\\w+@[a-z]+(\\.[a-z]+){1,2}";

    @Test
    void isEmail() {
        String email = "nguyenvansuong@gmail.com";

        boolean matches = email.matches(regex);
        Assert.isTrue(matches, "");
    }

    @Test
    void isEmail2() {
        String email = "nguyenvansuong@gmail.com.vn";

        boolean matches = email.matches(regex);
        Assert.isTrue(matches, "");
    }

    @Test
    void notEmail1() {
        String email = "1nguyen@gmaill.com.vn";

        boolean matches = email.matches(regex);
        Assert.isTrue(!matches, "");
    }

    @Test
    void notEmail2() {
        String email = "nguyengmaill.com.vn";

        boolean matches = email.matches(regex);
        Assert.isTrue(!matches, "");
    }



}
