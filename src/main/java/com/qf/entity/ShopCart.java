package com.qf.entity;

import com.qf.domain.ShopDomain;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @author qq166
 */
public class ShopCart {
	private List<ShopDomain> list = new ArrayList<>();

	
	public boolean addShopCart(ShopDomain shopDomain){
		for(ShopDomain sd : list){
			if(sd.getGoods().getId().equals(shopDomain.getGoods().getId())){
				int count = sd.getCount()+shopDomain.getCount();
				if(count>sd.getGoods().getCount()){
					return false;
				}
				sd.setCount(count);
				return true;
			}
		}
		list.add(shopDomain);
		return true;
	}
	
	public void removeShopCart(int id){
		for(ShopDomain sd : list){
			if(sd.getGoods().getId()==id){
				list.remove(sd);
				return;
			}
		}
	}

	public List<ShopDomain> getList() {
		return list;
	}

	public void setList(List<ShopDomain> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ShopCart [list=" + list + "]";
	}

	public ShopCart() {
		super();
	}

	public String changeCount(int id, String name,int c) {
		double pirce = 0;
		for(ShopDomain sd : list){
			if(sd.getGoods().getId()==id){
				if("min".equals(name)){
					sd.setCount(sd.getCount()-1);
				}else if ("add".equals(name)) {
					sd.setCount(sd.getCount()+1);
				}else if ("textBox".equals(name)) {
					if(c>sd.getGoods().getCount()){
						return "beyond";
					}
					sd.setCount(c);
				}
				pirce = sd.getCount()*sd.getGoods().getPrice();
				break;
			}
		}
		return new DecimalFormat("#.00").format(pirce);
		
	}
	
	public double getPirce(){
		double pirce = 0.0;
		for(ShopDomain sd : list){
			pirce += sd.getCount()*sd.getGoods().getPrice();
		}
		return pirce;
	}
	
	
	
}
