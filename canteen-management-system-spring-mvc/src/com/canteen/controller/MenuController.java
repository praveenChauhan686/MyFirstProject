package com.canteen.controller;
import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.canteen.dto.*;
import com.canteen.service.*;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	
	@RequestMapping(value = "/scroll.htm")
	public String itemList1(ModelMap model) {
		System.out.println("Menu controller start");
		List<Menu> ulist1 = menuService.selectAllItems1();	
		
		model.put("menu", ulist1);			
		System.out.println("Menu controller End");
		return "dailyMenu";
	}

}
