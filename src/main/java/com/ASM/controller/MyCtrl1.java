package com.ASM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyCtrl1 {
	@RequestMapping("/ctrl/url1")
	public String method1() {
		return "view";
	}
	@RequestMapping("/ctrl/url2")
	public String method2() {
		return "view";
	}
	@RequestMapping("/ctrl/url3")
	public String method3() {
		return "view";
	}
	@RequestMapping("/ctrl/url4")
	public String method4() {
		return "view";
	}
	@RequestMapping("/ctrl/url5")
	public String method5() {
		return "view";
	}
}