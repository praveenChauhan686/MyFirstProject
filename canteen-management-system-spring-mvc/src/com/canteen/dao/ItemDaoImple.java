package com.canteen.dao;

import java.awt.event.ItemListener;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
//import org.hibernate.tuple.TimestampGenerators.CurrentDateGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.canteen.dto.*;



@Repository
public class ItemDaoImple implements ItemDao {
	
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy | HH:mm:ss");
	Date date = new Date();

	@Autowired
	private HibernateTemplate hibernateTemplate;
	/*public void save(final Item item) {
		hibernateTemplate.execute(new HibernateCallback<List<Item>>() {
			public List<Item> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.save(item);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}*/

	
	
	@Override
	public List<Daily> getDate(Daily date) {
	// TODO Auto-generated method stub
	List<Daily> ul = hibernateTemplate.execute(new HibernateCallback<List<Daily>>() {
	public List<Daily> doInHibernate(Session session) throws HibernateException {
	Transaction t = session.beginTransaction();
	Query q = session.createQuery("from Daily where month(date) between ? and '02' and year(date) between ? and 2019");
	//Query q = session.createQuery("from Daily where month=? or year=?");

	q.setInteger(0,date.getMonth());
	q.setInteger(1, date.getYear());

	System.out.println(q);
	List<Daily> itemList = q.list();
	//System.out.println();
	for(Daily u : itemList) {
	//System.out.println("after");
	System.out.println(u.getCoursename()+u.getItemname());
	System.out.println();
	}
	t.commit();
	session.flush();
	session.close();
	return itemList;
	}
	});
	return ul;
	}
	
	
	
	public void deleteById(final String itemId) {
		hibernateTemplate.execute(new HibernateCallback<List<Item>>() {
			public List<Item> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.delete(new Item(itemId));
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}

	public void update(final Item item) {
		
		hibernateTemplate.execute(new HibernateCallback<List<Item>>() {
			public List<Item> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				session.update(item);
				t.commit();
				session.flush();
				session.close();
				return null;
			}
		});
	}

	public List<Item> getAll() {
		List<Item> ul = hibernateTemplate.execute(new HibernateCallback<List<Item>>() {
			public List<Item> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Item");
				System.out.println("hi");
				List<Item> itemList = q.list();
				t.commit();
				session.flush();
				session.close();
				return itemList;
			}
		});
		return ul;
	}
	

	
	@Override
	public void saveUser(final UserRegistrationForm user) {
		hibernateTemplate.execute(new HibernateCallback<List<UserRegistrationForm>>() {
			
			public List<UserRegistrationForm> doInHibernate(Session session) throws HibernateException {
				if(true) {
				Transaction t = session.beginTransaction();
				session.save(user);
				t.commit();
				session.flush();
				session.close();
				session.cancelQuery();
				}
				
				return null;
			}
		});
	}

	@Override
	public UserRegistrationForm validateUser(UserRegistrationForm user) {
		List<UserRegistrationForm> ul = hibernateTemplate.execute(new HibernateCallback<List<UserRegistrationForm>>() {
			public List<UserRegistrationForm> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from UserRegistrationForm where UserName = ? and Password = ?");
				q.setString(0, user.getUserName());
				q.setString(1, user.getPassword());
				List<UserRegistrationForm> userList = q.list();
				t.commit();
				session.flush();
				session.close();
			
				return userList;
			}
		});
		if(!ul.isEmpty()) {
			return ul.get(0);
		}	
		return null;
	}

	/*@Override
	public UserRegistrationForm validateUser2(UserRegistrationForm user) {
		List<UserRegistrationForm> ul = hibernateTemplate.execute(new HibernateCallback<List<UserRegistrationForm>>() {
			public List<UserRegistrationForm> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from UserRegistrationForm where  UserId = ?");
				q.setInteger(0, user.getUserId());
				
				List<UserRegistrationForm> userList = q.list();
				t.commit();
				session.flush();
				session.close();
			
				return userList;
			}
		});
		if(!ul.isEmpty()) {
			return user;
		}	
		return null;
	}
	
	
*/
	
	@Override
	public List<Item> save(Menu item) {
		List<Item> ul = hibernateTemplate.execute(new HibernateCallback<List<Item>>() {
			public List<Item> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				System.out.println("before hibernate query");
				Query q;
				String s = item.getService().toString();
				if(s.equals("lunch")) {
					 q = session.createQuery("from Item where courseId=? " );
					//Query q = session.createQuery("from Daily where month=? or year=?");
			           q.setString(0,item.getService());
			          // q.setString(1,"breakfast");
			      
				}
				else {
				 q = session.createQuery("from Item where courseId=?");
				//Query q = session.createQuery("from Daily where month=? or year=?");
		           q.setString(0,item.getService());
		         
				}
				List<Item> itemList = q.list();
				
				//System.out.println();
				 for(Item u : itemList) {
						//System.out.println("after");
						System.out.println(u.getCourseId()+u.getItemName());
						System.out.println();
					}
				t.commit();
				session.flush();
				session.close();
				return itemList;
			}
		});
		return ul;
	}

	
	/*@Override
	public List<Item> save(Menu item) {
	List<Item> ul = hibernateTemplate.execute(new HibernateCallback<List<Item>>() {
	public List<Item> doInHibernate(Session session) throws HibernateException {
	Transaction t = session.beginTransaction();
	System.out.println("before hibernate query");

	Query q = session.createQuery("from Item where courseId=? and courseId=?");
	//Query q = session.createQuery("from Daily where month=? or year=?");


	              q.setString(0,item.getService());
	              q.setString(1, item.getService());

	List<Item> itemList = q.list();
	//System.out.println();
	for(Item u : itemList) {
	//System.out.println("after");
	System.out.println(u.getCourseId()+u.getItemName());
	System.out.println();
	}
	t.commit();
	session.flush();
	session.close();
	return itemList;
	}
	});
	return ul;
	}*/



	@Override
	public boolean loginMethod(Login log) {
		List<Login> ul = hibernateTemplate.execute(new HibernateCallback<List<Login>>() {
			public List<Login> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query q = session.createQuery("from Login where username=? and password=?");
				//Query q = session.createQuery("from Daily where month=? or year=?");
				
				q.setString(0, log.getUsername());
				q.setString(1,log.getPassword());
				List<Login> itemList = q.list();
				t.commit();
				session.flush();
				session.close();
				return itemList;
			}
		});
		
		if(ul.isEmpty())
		return false;
		else
		return true;	
	}



	@Override
	public void addItem(List<String> al,String course) {
	
		
		hibernateTemplate.execute(new HibernateCallback<List<String>>() {
			

			public List<String> doInHibernate(Session session) throws HibernateException {
				for(int i=0;i<al.size();i++)
				{	
				Transaction t = session.beginTransaction();
				SQLQuery query = session.createSQLQuery("insert into AddItem (item,courseId,date) values(?,?,?)");
				query.setParameter(0,al.get(i).toString());
				query.setParameter(1,course);
				query.setDate(2,date);
				query.executeUpdate();
				System.out.println("result===="+al.get(i).toString());
				t.commit();
				}
				session.flush();
				session.close();
				return null;
			}
		});
				
		
	}




	@Override
	public List<AddItem> retriveDailyMenuDao() {
		List<AddItem> ul = hibernateTemplate.execute(new HibernateCallback<List<AddItem>>() {
			public List<AddItem> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				Query query = session.createQuery("from AddItem");
			    List<AddItem> itemList = query.list();
				t.commit();
				session.flush();
				session.close();
				return itemList;
			}
		});
       return ul;
	}



	

	/*@Override
	public List<AddItem> save123(Menu menu) {
		List<AddItem> ul = hibernateTemplate.execute(new HibernateCallback<List<AddItem>>() {
			public List<AddItem> doInHibernate(Session session) throws HibernateException {
				Transaction t = session.beginTransaction();
				System.out.println("before hibernate query");
				Query q;
					 q = session.createQuery("from Item where courseId=? " );
					 q.setString(0,menu.getService());
			    List<AddItem> itemList = q.list();
				t.commit();
				session.flush();
				session.close();
				return itemList;
			}
		});
		return ul;
	}
	*/
	
	
	
	//transaction fetching data according to selected course..
		@Override
		public List<AddItem> save123(Menu menu) {
			List<AddItem> ul = hibernateTemplate.execute(new HibernateCallback<List<AddItem>>() {
				public List<AddItem> doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					System.out.println("before hibernate query");
					Query q;
						 q = session.createQuery("from AddItem where courseId=? and date=?" );
						 q.setString(0,menu.getService());
						 q.setDate(1,date);
				    List<AddItem> itemList = q.list();
					t.commit();
					session.flush();
					session.close();
					return itemList;
				}
			});
			return ul;
		}
		//transaction fetching data according to selected course..END
	

		//ajax..................
		@Override
		public List<String> getItemName(String itemno) {
			List<String> itemlist = hibernateTemplate.execute(new HibernateCallback<List<String>>() {
				public List<String> doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					SQLQuery query = session.createSQLQuery("select item from AddItem where id=?");
					query.setParameter(0,itemno);
				    List<String> iList= query.list();
					t.commit();
					session.flush();
					session.close();
					return iList;
				}
			});
	       return itemlist;
		}

		@Override
		public List<Double> getPrice(String itemname) {
			List<Double> pricelist = hibernateTemplate.execute(new HibernateCallback<List<Double>>() {
				public List<Double> doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					SQLQuery query = session.createSQLQuery("select itemPrice from item where itemName=?");
					query.setParameter(0,itemname);
				    List<Double> iList= query.list();
					t.commit();
					session.flush();
					session.close();
					return iList;
				}
			});
	       return pricelist;
		}
		
		@Override
		public List<String> getPersonName(String personId) {
			List<String> personlist = hibernateTemplate.execute(new HibernateCallback<List<String>>() {
				public List<String> doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					SQLQuery query = session.createSQLQuery("select person_name from Person where person_id=?");
					query.setParameter(0,personId);
				    List<String> pList= query.list();
					t.commit();
					session.flush();
					session.close();
					return pList;
				}
			});
	       return personlist;
		}
		
		@Override
		public List<AddItem> getServiceMenu(String serviceType){
			List<AddItem> ul = hibernateTemplate.execute(new HibernateCallback<List<AddItem>>() {
				public List<AddItem> doInHibernate(Session session) throws HibernateException {
					Transaction t = session.beginTransaction();
					Query query = session.createQuery("from AddItem where courseId = serviceType");
				    List<AddItem> itemList = query.list();
					t.commit();
					session.flush();
					session.close();
					return itemList;
				}
			});
	       return ul;
		}


}



	
	

	
