package fpoly.java5.assignment.controller;

import fpoly.java5.assignment.model.User;
import fpoly.java5.assignment.service.ItemService;
import fpoly.java5.assignment.service.ReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import fpoly.java5.assignment.service.CategoryService;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class HomeController {

	@Autowired
	ReceiptService receiptService;

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping(path = {"/home", "/"})
	public String home(Model model) {
		model.addAttribute("categories", categoryService.findAll());
		return "home";
	}

	@GetMapping("/history")
	public String history(Model model,
						  HttpSession session,
						  @RequestParam(required = false) String today,
						  @RequestParam(defaultValue = "id") String sort,
						  @RequestParam(defaultValue = "ASC") String direction) {

		Date date = null;

		if (today != null) {
			date = new Date();
		}

		model.addAttribute("histories", receiptService.findByUserId(sort, direction, date));
		return "history-order";
	}
}
