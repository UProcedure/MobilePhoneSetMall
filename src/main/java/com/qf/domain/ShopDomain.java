package com.qf.domain;

import com.qf.entity.Goods;

public class ShopDomain {
	private int count;
	private Goods goods;

	public ShopDomain() {
		super();
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Override
	public String toString() {
		return "ShopDomain [count=" + count + ", goods=" + goods + "]";
	}

	public ShopDomain(int count, Goods goods) {
		super();
		this.count = count;
		this.goods = goods;
	}

}
