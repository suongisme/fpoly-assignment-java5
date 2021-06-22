package fpoly.java5.assignment.controller.admin;

import fpoly.java5.assignment.model.Receipt;
import fpoly.java5.assignment.service.ReceiptService;
import fpoly.java5.assignment.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminReceiptController {

    @Autowired
    private ReceiptService receiptService;

    @GetMapping("/receipt-management")
    public String receipt(Model model, @RequestParam(defaultValue = "1") Integer page) {
        Page<Receipt> all = receiptService.findAll(page);
        model.addAttribute("receipts", all.getContent());
        model.addAttribute("pages", PageUtils.getPages(all.getTotalPages()));
        return "receipt-management";
    }
}
