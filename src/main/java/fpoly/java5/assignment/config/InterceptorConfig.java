package fpoly.java5.assignment.config;

import fpoly.java5.assignment.interceptor.AdminLoginInterceptor;
import fpoly.java5.assignment.interceptor.AssignFormInterceptor;
import fpoly.java5.assignment.interceptor.AuthInterceptor;
import fpoly.java5.assignment.interceptor.LoginInterceptor;
import fpoly.java5.assignment.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    private CategoryService categoryService;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // user must login before
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/logout", "/payment/**", "/history")
                .excludePathPatterns("/admin/login")
                .order(1);

        // admin must login before
        registry.addInterceptor(new AdminLoginInterceptor())
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin/login")
                .order(1);

        // must be admin
        registry.addInterceptor(new AuthInterceptor())
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin/login")
                .order(2);

        // assign object before show form
        registry.addInterceptor(new AssignFormInterceptor(categoryService))
                .addPathPatterns("/admin/**")
                .order(1);
    }
}
