package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainConroller {
	
	@RequestMapping("/test")
	public String hello(Model model) {
		model.addAttribute("msg", "abcdef...");
		return "hello";
	}

}
