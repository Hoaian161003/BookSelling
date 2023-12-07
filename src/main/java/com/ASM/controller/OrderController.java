package com.ASM.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ASM.cart.CartService;
import com.ASM.entity.Account;
import com.ASM.entity.Order;
import com.ASM.entity.OrderDetail;
import com.ASM.entity.Product;
import com.ASM.service.AccountService;
import com.ASM.service.OrderDetailService;
import com.ASM.service.OrderService;
import com.ASM.service.ProductService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	AccountService accountService;
	@Autowired
	CartService cartService;
	@Autowired
	ProductService productService;
	@Autowired
	OrderDetailService orderDetailService;
	
	@GetMapping("/order/checkout")
	public String checkout(@ModelAttribute("order") Order order, Authentication auth) {
		String username = auth.getName();
		Account account = accountService.findById(username);
		order.setCreateDate(new Date());
		order.setAccount(account);
		return "order/checkout";
	}
	@PostMapping("/order/checkout")
	public String checkout(Model model, 
			@ModelAttribute("order") Order order) {
		// insert order
		orderService.create(order);
		
		cartService.getItems().forEach(item -> {
			// tạo đối tượng order detail
			OrderDetail detail = new OrderDetail();
			detail.setPrice(item.getPrice());
			detail.setQuantity(item.getQuantity());
			detail.setOrder(order);
			Product product = productService.findById(item.getId());
			if (item.getQuantity()<= product.getSoluong()&& product.getSoluong()>0) {
				int sl = product.getSoluong()- item.getQuantity();
				product.setSoluong(sl);
			}
			
			detail.setProduct(product);
			orderDetailService.create(detail);
			productService.update(product);
		});
		cartService.clear();
		return "redirect:/order/list";
	}
	
	@RequestMapping("/order/list")
	public String list(Model model, Authentication auth) {
		String username = auth.getName();
		Account account = accountService.findById(username);
		model.addAttribute("user", account);
		return "order/list";
	}
	
	@RequestMapping("/order/detail/{id}")
	public String detail(Model model, @PathVariable("id") Long id) {
		Order order = orderService.findById(id);
		model.addAttribute("order", order);
		return "order/detail";
	}
}