package com.hash.dao;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.hash.model.Item;

@Repository("itemDao")
public class ItemDaoImpl implements ItemDao {

	 @Autowired
	 private SessionFactory sessionFactory;
	
	public void addItem(Item item) {
		sessionFactory.getCurrentSession().saveOrUpdate(item);
	}

	@SuppressWarnings("unchecked")
	public List<Item> listItems() {
		return (List<Item>) sessionFactory.getCurrentSession().createCriteria(Item.class).list();
	}

	@Override
	public Item getItem(int itemid) {
		return (Item) sessionFactory.getCurrentSession().get(Item.class, itemid);
	}

	@Override
	public void deleteItem(Item item) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Item WHERE itemid = "+item.getItemId()).executeUpdate();

	}

}
