package com.qf.entity;

import java.util.Date;

public class Order {
    private Integer id;

    private String sendtype;

    private Date date;

    private Integer addressId;

    private Integer userId;

    private String addressName;

    private String userName;

    private String adree;

    public String getAdree() {
        return adree;
    }

    public void setAdree(String adree) {
        this.adree = adree;
    }


    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSendtype() {
        return sendtype;
    }

    public void setSendtype(String sendtype) {
        this.sendtype = sendtype;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", sendtype=").append(sendtype);
        sb.append(", date=").append(date);
        sb.append(", addressId=").append(addressId);
        sb.append(", userId=").append(userId);
        sb.append("]");
        return sb.toString();
    }
}