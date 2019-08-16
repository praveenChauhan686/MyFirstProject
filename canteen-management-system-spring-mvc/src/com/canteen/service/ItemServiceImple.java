package com.canteen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.canteen.dao.*;
import com.canteen.dto.*;

@Service
public class ItemServiceImple implements ItemService {
	@Autowired
	private ItemDao itemDao;
	
	
	/*public void createItem(Item item) {
		itemDao.save(item);
	}*/
	
	public void removeItem(String itemId) {
		itemDao.deleteById(itemId);
	}
	
	public void modifyItem(Item item) {
		itemDao.update(item);
	}
	
	public List<Item> selectAllItems() {
		return itemDao.getAll();
	}

	
	
	public List<Item> createItem(Menu item) {

		return itemDao.save(item);
		}
   
	
	
	public void createUser(UserRegistrationForm user) {
		itemDao.saveUser(user);
	}
	
	
	@Override
	public void registrationMethod(UserRegistrationForm log) {
		// TODO Auto-generated method stub
		 itemDao.saveUser(log);
	}

	@Override
	public List<Daily> retriveDate(Daily date) {
	// TODO Auto-generated method stub

	return itemDao.getDate(date);
	}
	
	@Override
	public UserRegistrationForm checkUser(UserRegistrationForm user) {
	
		return itemDao.validateUser(user);
	}

	
	@Override
	public void addDailyItem(List<String> al, String course) {
		// TODO Auto-generated method stub
		itemDao.addItem(al, course);
	}

	@Override
	public List<AddItem> retriveDailyMenu() {
		// TODO Auto-generated method stub
		return itemDao.retriveDailyMenuDao();
	}

	
	@Override
	public List<AddItem> createItem123(Menu menu) {
		// TODO Auto-generated method stub
		return itemDao.save123(menu);
	}


	@Override
	public List<String> getPersonName(String personId) {
		return itemDao.getPersonName(personId);
	}

	@Override
	public List<AddItem> getServiceMenu(String serviceType) {
		// TODO Auto-generated method stub
		return itemDao.getServiceMenu(serviceType);
	}

	public List<String> getItemName(String itemno){
		return itemDao.getItemName(itemno);
		}

		public List<Double> getPrice(String itemname){
		return itemDao.getPrice(itemname);
		}


	  

	
	
}