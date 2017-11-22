package com.hash.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.hash.dao.ItemDao;
import com.hash.model.Item;

@Service("itemService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ItemServiceImpl implements ItemService{

	@Autowired
	 private ItemDao itemDao;
	
	 @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addItem(Item item) {
		 itemDao.addItem(item);
	}

	public List<Item> listItems() {
		return itemDao.listItems();
	}

	public Item getItem(int itemid) { 
		 return itemDao.getItem(itemid);
	}


	public void deleteItem(Item item) {
		itemDao.deleteItem(item);
		
	}

	
}
