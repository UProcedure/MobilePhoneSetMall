package com.qf.entity;

public class Brand {
    private Integer id;

    private String phonename;

    private String phoneimage;

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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", phonename=").append(phonename);
        sb.append(", phoneimage=").append(phoneimage);
        sb.append("]");
        return sb.toString();
    }
}