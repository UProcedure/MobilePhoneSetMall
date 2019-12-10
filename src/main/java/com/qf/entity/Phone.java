package com.qf.entity;

public class Phone {
    private Integer id;

    private String phonename;

    private String phoneimage;

    private Integer price;

    private Integer productId;

    private Integer brandId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhonename() {
        return phonename;
    }

    public void setPhonename(String phonename) {
        this.phonename = phonename;
    }

    public String getPhoneimage() {
        return phoneimage;
    }

    public void setPhoneimage(String phoneimage) {
        this.phoneimage = phoneimage;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", phonename=").append(phonename);
        sb.append(", phoneimage=").append(phoneimage);
        sb.append(", price=").append(price);
        sb.append(", productId=").append(productId);
        sb.append(", brandId=").append(brandId);
        sb.append("]");
        return sb.toString();
    }
}