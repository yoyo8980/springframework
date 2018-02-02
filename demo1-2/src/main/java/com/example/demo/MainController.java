package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Mapper.DaoMapper;

@Controller
public class MainController {
	@Autowired
	DaoMapper mapper;
	
	@RequestMapping("/guest")
	public void list(Model model) throws Exception {
		model.addAttribute("list",mapper.selectAll());
	}
	@RequestMapping("/guest/{1}")
	public String detail(Model model, @PathVariable("1") int id) throws Exception {
		model.addAttribute("bean",mapper.selectOne(id));
		return "detail";
	}
}
