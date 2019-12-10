package com.qf.entity;

/**
 * @author qq166
 */
public class Goods {
    private Integer id;

    private String name;

    private String imagesPath;

    private Integer count;

    private Double price;

    private Integer phoneId;

    private Integer filmId;

    private String phoneName;

    private String filmName;

    public String getPhoneName() {
        return phoneName;
    }

    public void setPhoneName(String phoneName) {
        this.phoneName = phoneName;
    }

    public String getFilmName() {
        return filmName;
    }

    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImagesPath() {
        return imagesPath;
    }

    public void setImagesPath(String imagesPath) {
        this.imagesPath = imagesPath;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getPhoneId() {
        return phoneId;
    }

    public void setPhoneId(Integer phoneId) {
        this.phoneId = phoneId;
    }

    public Integer getFilmId() {
        return filmId;
    }

    public void setFilmId(Integer filmId) {
        this.filmId = filmId;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", imagesPath='" + imagesPath + '\'' +
                ", count=" + count +
                ", price=" + price +
                ", phoneId=" + phoneId +
                ", filmId=" + filmId +
                ", phoneName='" + phoneName + '\'' +
                ", filmName='" + filmName + '\'' +
                '}';
    }
}