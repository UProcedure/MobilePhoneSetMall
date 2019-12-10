package com.qf.entity;

public class Film {
    private Integer id;

    private String name;

    private String filmimage;

    private Integer productId;

    private Integer phoneId;

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

    public String getFilmimage() {
        return filmimage;
    }

    public void setFilmimage(String filmimage) {
        this.filmimage = filmimage;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getPhoneId() {
        return phoneId;
    }

    public void setPhoneId(Integer phoneId) {
        this.phoneId = phoneId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", filmimage=").append(filmimage);
        sb.append(", productId=").append(productId);
        sb.append(", phoneId=").append(phoneId);
        sb.append("]");
        return sb.toString();
    }
}