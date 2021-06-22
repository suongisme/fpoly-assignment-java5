package fpoly.java5.assignment.controller;

import fpoly.java5.assignment.model.Item;
import fpoly.java5.assignment.model.Topping;
import fpoly.java5.assignment.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SizeService sizeService;
	
	@Autowired
	private IceService iceService;
	
	@Autowired
	private SugarService sugarService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ToppingService toppingService;

	@Autowired
	private CartService cartService;
	
	@PostMapping
	public String addItem(Item item, HttpServletRequest request) {

		String[] toppings = request.getParameterValues("topping");

		List<Topping> toppingList = new ArrayList<>();

		if (toppings != null) {
			for (String x : toppings) {
				Topping byId = toppingService.findById(Long.parseLong(x));
				toppingList.add(byId);
			}
		}

		item.setTopping(toppingList);

		cartService.addToCart(item);

		return "redirect:/order";
	}

	@GetMapping("/increase/{id}")
	@ResponseBody
	public String increaseQuantityCart(@PathVariable Long id) throws InterruptedException {
		List<Item> all = cartService.getAll();

		all.forEach(item -> {
			if (item.getProduct().getId() == id) {
				item.setQuantity(item.getQuantity()+1);
			}
		});

		cartService.reAdd(all);

		Thread.sleep(2000);

		return "ok";
	}

	@GetMapping("/decrease/{id}")
	@ResponseBody
	public String decreaseQuantityCart(@PathVariable Long id) {
		List<Item> all = cartService.getAll();

		Iterator<Item> iterator = all.iterator();

		while (iterator.hasNext()) {
			Item item = iterator.next();
			if (item.getProduct().getId() == id) {
				item.setQuantity(item.getQuantity() - 1);
			}

			if (item.getQuantity() == 0) {
				iterator.remove();
			}
		}

		cartService.reAdd(all);
		return "ok";
	}

	@GetMapping("/clear")
	public String removeCart(HttpServletRequest request) {
		cartService.removeAll();
		return "redirect:/order";
	}
	
}
