package com.hash.dao;

import java.util.List;

import com.hash.model.Item;

public interface ItemDao {

	 public void addItem(Item item);

	 public List<Item> listItems();
	 
	 public Item getItem(int itemid);
	 
	 public void deleteItem(Item item);

}

