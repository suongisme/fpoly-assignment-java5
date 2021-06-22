package fpoly.java5.assignment;

import org.junit.jupiter.api.Test;
import org.springframework.util.Assert;

public class UsernamTest {

    String regex = "[[a-z]\\_]+";

    @Test
    public void isUsername() {
        String username = "ngnuyenvansuong";
        boolean matches = username.matches(regex);

        Assert.isTrue(matches, "isUsername()");
    }

    @Test
    public void notUsername1() {
        String username = "ngnuyenvansu@ong";
        boolean matches = username.matches(regex);

        Assert.isTrue(!matches, "notUsername1()");
    }

    @Test
    public void notUsername2() {
        String username = "ngnuyenvansu ong";
        boolean matches = username.matches(regex);

        Assert.isTrue(!matches, "notUsername2()");
    }

    @Test
    public void notUsername3() {
        String username = " ngnuyenvansuong";
        boolean matches = username.matches(regex);

        Assert.isTrue(!matches, "notUsername3()");
    }
}
