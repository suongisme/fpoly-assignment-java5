package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Product;
import fpoly.java5.assignment.service.ImageService;
import fpoly.java5.assignment.service.ProductService;
import fpoly.java5.assignment.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ImageService imageService;

    @GetMapping("/product-management")
    public String product(Model model, @RequestParam(defaultValue = "1") Integer page ) {
        Page<Product> result = productService.findAll(page);
        model.addAttribute("products", result.getContent());
        model.addAttribute("pages", PageUtils.getPages(result.getTotalPages()));
        return "product-management";
    }

    @GetMapping("/form-product/{id}")
    public String showFormProduct(@PathVariable Long id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "admin-form";
    }

    @PostMapping("/product")
    public String submit(@Valid @ModelAttribute Product product,
                         BindingResult result,
                         RedirectAttributes redirectAttributes,
                         @RequestParam(name = "file") MultipartFile multipartFile) {

        if (result.hasErrors()) {
            return "admin-form";
        }

        try {
            if (!multipartFile.getOriginalFilename().isBlank()) {
                String path = imageService.store(multipartFile);
                product.setImage(path);
            }
            productService.submit(product);
            redirectAttributes.addFlashAttribute("notify", "Thao tác thành công!");
        } catch (Exception e) {
            if (e instanceof IOException) {
                redirectAttributes.addFlashAttribute("notify", "Lôi upload ảnh!");
            } else {
                redirectAttributes.addFlashAttribute("notify", "Thao tác lỗi");
            }
        }

        return "redirect:/admin/product-management";
    }

    @GetMapping("/product/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            productService.delete(id);
            redirectAttributes.addFlashAttribute("notify", "Xóa thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("notify", "Xóa thất bại!");
        }
        return "redirect:/admin/product-management";
    }
}
