package com.qf.entity;

/**
 * @author weimin
 * @ClassName GoodsInfo
 * @Description TODO
 * @date 2019/10/11 15:12
 */
public class GoodsInfo {
    private Goods goods;
    private Film film;
    private Phone phone;

    public GoodsInfo(Goods goods, Film film, Phone phone) {
        this.goods = goods;
        this.film = film;
        this.phone = phone;
    }

    public GoodsInfo() {
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public Phone getPhone() {
        return phone;
    }

    public void setPhone(Phone phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "GoodsInfo{" +
                "goods=" + goods +
                ", film=" + film +
                ", phone=" + phone +
                '}';
    }
}
