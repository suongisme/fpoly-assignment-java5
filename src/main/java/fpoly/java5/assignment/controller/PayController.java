package fpoly.java5.assignment.controller;

import fpoly.java5.assignment.model.Item;
import fpoly.java5.assignment.model.Receipt;
import fpoly.java5.assignment.model.User;
import fpoly.java5.assignment.service.CartService;
import fpoly.java5.assignment.service.ItemService;
import fpoly.java5.assignment.service.ReceiptService;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/payment")
public class PayController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ReceiptService receiptService;

	@Autowired
	private CartService cartService;

	@GetMapping
	public String pay(HttpSession session, RedirectAttributes redirectAttributes) {

		// 1. get all products in cart
		List<Item> items = cartService.getAll();

		if (items.isEmpty()) {
			redirectAttributes.addFlashAttribute("notify", "bạn chưa chọn sản phẩm nào!");
			return "redirect:/order";
		}

		try {
			// 2. get user logged
			User login = (User) session.getAttribute("login");

			// 3. create a receipt with use logged and date now
			Receipt receipt = new Receipt();
			receipt.setDate(new Date());
			receipt.setUser(login);

			// 4. store receipt to DB
			Receipt receipt1 = receiptService.addReceipt(receipt);

			// 5. store those products to DB with receipt above
			itemService.addItem(items, receipt1);

			// 6. remove all products in cart
			cartService.removeAll();
			redirectAttributes.addFlashAttribute("notify", "Đặt hàng thành công");

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("notify", "đặt hàng thất bại!");
		}
		return "redirect:/order";
	}
}
