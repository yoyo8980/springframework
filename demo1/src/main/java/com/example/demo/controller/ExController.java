package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ExController {
	@RequestMapping("/ex02")
	public String Ex02(Model model) {
		model.addAttribute("msg", "hello world");
		return "view02";
	}
}
