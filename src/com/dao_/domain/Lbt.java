package com.dao_.domain;

public class Lbt {
    private String id;
    private String biaoti;
    private String image;

    public Lbt() {
    }

    public Lbt(String id, String biaoti, String image) {
        this.id = id;
        this.biaoti = biaoti;
        this.image = image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBiaoti() {
        return biaoti;
    }

    public void setBiaoti(String biaotiid) {
        this.biaoti = biaotiid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
