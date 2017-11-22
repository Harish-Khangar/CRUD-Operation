package com.hash.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jettison.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hash.bean.ItemBean;
import com.hash.model.Item;
import com.hash.service.ItemService;

@Controller
public class ItemController {
	
	@Autowired
	 private ItemService itemService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveItem(@ModelAttribute("command")ItemBean itemBean, 
	   BindingResult result) {
	  Item item = prepareModel(itemBean);
	  itemService.addItem(item);
	  return new ModelAndView("redirect:/add.html");
	 }
	
	@RequestMapping(value="/items", method = RequestMethod.GET)
	 public ModelAndView listItems() {
	  Map<String, Object> model = new HashMap<String, Object>();
	  model.put("items",  prepareListofBean(itemService.listItems()));
	  return new ModelAndView("itemList", model);
	 }
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	 public ModelAndView addItem(@ModelAttribute("command")ItemBean itemBean,
	   BindingResult result) {
	  Map<String, Object> model = new HashMap<String, Object>();
	  model.put("items",  prepareListofBean(itemService.listItems()));
	  return new ModelAndView("addItem", model);
	 }
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView welcome() {
	  return new ModelAndView("index");
	 }

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView editItem(@ModelAttribute("command")ItemBean itemBean,
	   BindingResult result) {
	 itemService.deleteItem(prepareModel(itemBean));
	  Map<String, Object> model = new HashMap<String, Object>();
	  model.put("item", null);
	  model.put("items",  prepareListofBean(itemService.listItems()));
	  return new ModelAndView("addItem", model);
	 }
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView deleteItem(@ModelAttribute("command")ItemBean itemBean,
	   BindingResult result) {
	  Map<String, Object> model = new HashMap<String, Object>();
	  model.put("item", prepareItemBean(itemService.getItem(itemBean.getId())));
	  model.put("items",  prepareListofBean(itemService.listItems()));
	  return new ModelAndView("addItem", model);
	 }
	 
	 private Item prepareModel(ItemBean itemBean){
	  Item item = new Item();
	  item.setItemMaster(itemBean.getiMaster());
	  item.setItemCode(itemBean.getiCode());
	  item.setItemName(itemBean.getiName());
	  item.setItemQty(itemBean.getiQty());
	  item.setItemId(itemBean.getId());
	  itemBean.setId(null);
	  return item;
	 }
	 
	 private List<ItemBean> prepareListofBean(List<Item> items){
		  List<ItemBean> beans = null;
		  if(items != null && !items.isEmpty()){
		   beans = new ArrayList<ItemBean>();
		   ItemBean bean = null;
		   for(Item item : items){
		    bean = new ItemBean();
		    bean.setiMaster(item.getItemMaster());
		    bean.setId(item.getItemId());
		    bean.setiName(item.getItemName());
		    bean.setiCode(item.getItemCode());
		    bean.setiQty(item.getItemQty());
		    beans.add(bean);
		   }
	  }
	   return  beans;
	 }
	 
	 
	 private ItemBean prepareItemBean(Item item){
	 ItemBean bean = new ItemBean();
	  bean.setiMaster(item.getItemMaster());
	  bean.setiCode(item.getItemCode());
	  bean.setiName(item.getItemName());
	  bean.setiQty(item.getItemQty());
	  bean.setId(item.getItemId());
	  return bean;
	 }
	
}


