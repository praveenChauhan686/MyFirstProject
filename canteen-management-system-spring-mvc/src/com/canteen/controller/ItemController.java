package com.canteen.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.canteen.dto.*;
import com.canteen.service.*;

@Controller
public class ItemController {
	
	static String course ="";
	@Autowired
	private ItemService itemService;
	
	/*@RequestMapping(value = "/save.htm")
	public String addItem(@RequestParam("msg") String message,ModelMap model) {
		System.out.println("Inside additem");
		String[] arrOfStr = message.split(" ");
		System.out.println("After spliting before merging to list");
                                                                 		//List<String> al = Arrays.asList(arrOfStr);
		 List<String> al = new ArrayList <String>(Arrays.asList(arrOfStr));
		
	                                                                  	//System.out.println("after list before calling dao");
		 itemService.addDailyItem(al,course);
		  
        for (String a : al) 
            System.out.println("arrayyyyyyy=="+a); 
	        System.out.println("after message="+message+"Menu"+course); 
		return "Link" ;
	}*/
	
	 @RequestMapping(value = "/prep_login_form.htm")
	 public String prepLoginForm(ModelMap model) { 
		 model.put("user", new UserRegistrationForm()); 
	     return "login";
	 }
	
	/*@RequestMapping(value = "/dailyMenu.htm", method = { RequestMethod.POST, RequestMethod.GET })
	public String itemList(ModelMap model) {
		List<Item> ulist = itemService.selectAllItems();
		 if(ulist!=null) {
			
				model.put("ul", ulist);
				
				return "dailyMenu";

				  }
				  else {
				  model.addAttribute("ul", new UserRegistrationForm());
				  return "login";
				  }
	}*/
	
	@RequestMapping(value = "/dateretrieve1.htm", method = { RequestMethod.POST, RequestMethod.GET })
	public String dateRetrive3(@RequestParam("month") int month,@RequestParam("year") int year,ModelMap model) {
		System.out.println(month);
		Daily date=new Daily(month,year);
		itemService.retriveDate(date);
		//model.put("user", new Daily());
		return "home";
	}
	
	
	
	@RequestMapping(value = "/reg.htm", method = { RequestMethod.POST, RequestMethod.GET })
/*	public String userRegistration(@RequestParam("UserId") String UserId , @RequestParam("UserName") String UserName, @RequestParam("Password") String Password,@RequestParam("EmailId") String EmailId, ModelMap model,HttpSession session) {
*/		
	public String userRegistration(UserRegistrationForm user, ModelMap model,HttpSession session) {
	
	/*UserRegistrationForm log=new UserRegistrationForm(UserId,UserName,Password,EmailId);*/
	
	  itemService.registrationMethod(user);
	
	  model.put("user", new UserRegistrationForm());
	  return "login";
	  

		
	
		
	}
	
	@RequestMapping(value="/prep_reg_form.htm", method = { RequestMethod.POST, RequestMethod.GET })
	public String prepRegForm(ModelMap model,HttpSession session)
	{
		model.put("user", new UserRegistrationForm());
		
		return "userRegistration";
	}
	
	@RequestMapping(value = "/login1.htm")
	public String login(UserRegistrationForm user,ModelMap model,HttpSession session) {
		
		
		UserRegistrationForm b = itemService.checkUser(user);
		
		if(b!=null) {
			session.setAttribute("user", b);
			return "Link";
			}
		
		model.put("user", new UserRegistrationForm());
	
		return "login";	
	}
	

	@RequestMapping(value = "/login_form.htm")
	public String loginForm(ModelMap model) 
	{
		model.put("user", new UserRegistrationForm());
		
		return "login";
		
	}
	
	
	
	@RequestMapping(value = "/login.htm", method = { RequestMethod.POST, RequestMethod.GET })
	public String login2(UserRegistrationForm user,ModelMap model,HttpSession session) {
		
		model.put("user", new UserRegistrationForm());
			session.setAttribute("user", user);
			return "Link";
					
		
		/*model.put("user", new UserRegistrationForm());
		return "login";*/
	}
	
	@RequestMapping(value = "/dateretrieve.htm", method = { RequestMethod.POST, RequestMethod.GET })
	public String dateRetrive2(@RequestParam("month") int month,@RequestParam("year") int year,ModelMap model) {
		System.out.println(month);
		Daily date=new Daily(month,year);
		List<Daily>uList=itemService.retriveDate(date);
	    model.put("ul",uList);
		return "monthlyItemReport";
	}
	
	
	@RequestMapping(value = "/logout.htm", method = { RequestMethod.POST, RequestMethod.GET })
    public String logout(HttpServletRequest request) {
        System.out.println("logout()");
        
        HttpSession httpSession = request.getSession();
        
        httpSession.invalidate();
        return "redirect:homePage.jsp";
    }
	
	
	/*@RequestMapping(value="/submitForm.htm", method = { RequestMethod.POST, RequestMethod.GET })  
	public String submitForm(Menu menu,ModelMap model,HttpSession session )  
	{  System.out.println("inside");
	List<Item> ulist=itemService.createItem(menu);
	System.out.println("inside create item");

	for(Item u : ulist) {
	System.out.println("**************++++++++++++++++++");
	System.out.println(u.getCourseId()+u.getItemName());
	System.out.println();
	}
	session.setAttribute("ul",ulist);

	//model.put("menu1",new Menu());
	   return "dailyMenu1";  
	}*/ 


/*	@RequestMapping(value = "/menucheck1.htm")
	public String menuInitial(Menu menu,ModelMap model) {
	model.put("menu",new Menu());
	return "dailyMenu1";
	}*/
	
	
	

	@RequestMapping(value = "/save.htm")
	public String addItem(@RequestParam("msg") String message,ModelMap model,HttpSession session) {
	String[] arrOfStr = message.split(" ");
	                                                      		
		 List<String> al = new ArrayList<String>(Arrays.asList(arrOfStr));
	     itemService.addDailyItem(al,course);
		return "Link" ;
	
	}
	
	
	
	@RequestMapping(value = "/dailyMenu.htm")
	public String itemList(ModelMap model, HttpSession session) {
		
		if(session.getAttribute("user") != null) {
			List<Item> ulist = itemService.selectAllItems();
			model.put("ul", ulist);
			
			return "dailyMenu";
			
		}
		else {
			model.put("user", new UserRegistrationForm());
			return "login";
		}
		
		
		
	}
	
	
	@RequestMapping(value = "/dateretrieve.htm")
	public String dateRetrive(@RequestParam("month") int month,@RequestParam("year") int year,ModelMap model) {
		System.out.println(month);
		Daily date=new Daily(month,year);
		List<Daily>uList=itemService.retriveDate(date);
	    model.put("ul",uList);
		return "monthlyItemReport";
	}
	
	

	@RequestMapping(value="/submitForm.htm")  
	public String submitForm(Menu menu,ModelMap model,HttpSession session )  
	{  
	    course = menu.getService().toString();
		List<Item> ulist=itemService.createItem(menu);
		model.put("menu1",ulist);
	    return "dailyMenuAdding";  
	}  
	
	
	@RequestMapping(value = "/menucheck1.htm")
	public String menuInitial(Menu menu,ModelMap model, HttpSession session) {
		
		model.put("menu",new Menu());
		return "dailyMenuAdding";
		
		
	}
	
	@RequestMapping(value = "/transact.htm")
	public String trans(Menu menu,ModelMap model, HttpSession session) {
	
		return "dailyMenuAdding";

	}
	
	@RequestMapping(value = "/transac.htm")
	public String transaction(Menu menu, ModelMap model) {
		
		//model.put("user", new UserRegistrationForm());
		model.put("menu",new Menu());
		return "transaction";
		
	}
	
	
	
	/*@RequestMapping(value="/transactionRetrive.htm")  
	public String trans(ModelMap model)  
	{ 
		List<AddItem> ulist=itemService.retriveDailyMenu();
		model.put("transactionmenu",ulist);
	    return "transaction";  
	}*/
	
	
	
	
	

	@RequestMapping(value="/transSubmit.htm")  
	public String submitForm(Menu menu,ModelMap model )  
	{  
	    course = menu.getService().toString();
		List<AddItem> ulist=itemService.createItem123(menu);
		model.put("menu1",ulist);
	    return "transaction";  
	}
	
	
	
	@RequestMapping(value = "/getstaffname.htm", method = RequestMethod.GET)
	@ResponseBody
	public String getPersonId(@RequestParam String personId) {
		String a = null;
		List<String> plist = itemService.getPersonName(personId);
		a = plist.get(0);
		return a;
	}
	
	@RequestMapping(value = "/getmenu.htm", method = RequestMethod.GET)
	@ResponseBody
	public List<AddItem> getServiceMenu(@RequestParam String serviceType) {
		//return itemService.getServiceMenu(serviceType);
		return null;
	}
	
	@RequestMapping(value = "/getitem.htm", method = RequestMethod.GET)
	@ResponseBody
	public String getItemId(@RequestParam String itemno) {
		System.out.println("inside controller");
		String a = null;
		List<String> ilist = itemService.getItemName(itemno);
		a = ilist.get(0);
		System.out.println(a);
		return a;
	}
	
	@RequestMapping(value = "/getamount.htm", method = RequestMethod.GET)
	@ResponseBody
	public String getPrice(@RequestParam String itemname) {
		System.out.println("inside controller");
		Double a;
		List<Double> ilist = itemService.getPrice(itemname);
		a = ilist.get(0);
		System.out.println("value" +a);
		return a.toString();
	}
	
	
}