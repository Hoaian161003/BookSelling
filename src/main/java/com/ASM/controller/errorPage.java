package com.ASM.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class errorPage {
	@GetMapping("/error")
	public String errorPages() {
	    return "error"; // Tên file template là "error.html"
	}

}
