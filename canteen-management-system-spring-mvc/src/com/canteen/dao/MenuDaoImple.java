package com.canteen.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.canteen.dto.Menu;

@Repository
public class MenuDaoImple implements MenuDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	@Override	
	public List<Menu> getAll1() {
		List<Menu> ul = hibernateTemplate.execute(new HibernateCallback<List<Menu>>() {
			public List<Menu> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Menu");
				List<Menu> itemList = q.list();
				for(Menu u : itemList) {
					//System.out.println(u.getId()+"---"+u.getService());
				}
				
				t.commit();
				session.flush();
				session.close();
				return itemList;
			}
		});
		return ul;
	}
}
