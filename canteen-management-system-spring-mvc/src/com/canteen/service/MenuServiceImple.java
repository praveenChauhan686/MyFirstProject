package com.canteen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.canteen.dao.MenuDao;
import com.canteen.dto.Menu;


@Service
public class MenuServiceImple implements MenuService {

	@Autowired
	private MenuDao menuDao;
	
	
	@Override
	public List<Menu> selectAllItems1() {
		// TODO Auto-generated method stub
		
		return menuDao.getAll1();
	}

}
