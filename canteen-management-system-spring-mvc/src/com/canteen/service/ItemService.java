package com.canteen.service;

import java.util.List;

import com.canteen.dto.*;

public interface ItemService {	
	public List<Item> createItem(Menu item);
	/*public void removeItem(String itemId);
	public void modifyItem(Item item);*/
	public List<Item> selectAllItems();
	public List<Daily> retriveDate(Daily date);
	
	public void registrationMethod(UserRegistrationForm log);
	public UserRegistrationForm checkUser(UserRegistrationForm user);
	public void addDailyItem(List<String> al, String course);
	public List<AddItem>retriveDailyMenu();
	
	public List<AddItem> createItem123(Menu menu);
	
	
	public List<String> getPersonName(String personId);
    public List<AddItem> getServiceMenu(String serviceType);
   
    public List<String> getItemName(String itemno);
    public List<Double> getPrice(String itemname);
	
}