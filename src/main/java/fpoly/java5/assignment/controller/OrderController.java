package fpoly.java5.assignment.controller;

import fpoly.java5.assignment.model.Item;
import fpoly.java5.assignment.model.Product;
import fpoly.java5.assignment.model.Size;
import fpoly.java5.assignment.service.*;
import fpoly.java5.assignment.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ToppingService toppingService;
	
	@Autowired
	private SizeService sizeService;
	
	@Autowired
	private IceService iceService;
	
	@Autowired
	private SugarService sugarService;

	@Autowired
	private CartService cartService;
	
	@GetMapping
	public String orderProduct(@RequestParam(defaultValue = "1", name = "category_id") Long categoryId,
							   @RequestParam(defaultValue = "1") Integer page,
							   Model model) {

		Page<Product> allByCategoryId = productService.findAllByCategoryId(categoryId, page);

		model.addAttribute("pages", PageUtils.getPages(allByCategoryId.getTotalPages()));
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("products", allByCategoryId.getContent());
		model.addAttribute("carts", cartService.getAll());
		return "order-page";
	}
	
	@GetMapping(params = {"product_id"})
	public String orderProduct(@RequestParam(required = true, name = "product_id") Long productId,
							   Model model) {

		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("products", productService.findAll());
		model.addAttribute("sizes", sizeService.findAll());
		model.addAttribute("sugars", sugarService.findAll());
		model.addAttribute("ices", iceService.findAll());
		model.addAttribute("toppings", toppingService.findAll());
		model.addAttribute("carts", cartService.getAll());

		model.addAttribute("product", productService.findById(productId));
		return "ordering";
	}
}
