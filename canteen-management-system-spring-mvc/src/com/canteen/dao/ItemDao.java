package com.canteen.dao;
import com.canteen.dto.*;
import java.util.List;

public interface ItemDao {	
	/*public void save(Item item);*/
	public List<Item> save(Menu item);
	public void deleteById(String itemId);	
	public void update(Item item) ;
	public List<Item> getAll() ;
	public List<Daily> getDate(Daily date);
	public void saveUser(UserRegistrationForm user);
	public UserRegistrationForm validateUser(UserRegistrationForm user);
	/*UserRegistrationForm validateUser2(UserRegistrationForm user);*/
	
	
	public boolean loginMethod(Login log);
	public void addItem(List<String> al,String course);
	public List<AddItem>retriveDailyMenuDao();
	
	public List<AddItem> save123(Menu menu);
    
    public List<String> getPersonName(String personId);
	public List<AddItem> getServiceMenu(String serviceType);
	public List<String> getItemName(String itemno);
	public List<Double> getPrice(String itemname);
}