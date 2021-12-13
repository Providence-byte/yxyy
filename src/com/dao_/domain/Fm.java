package com.dao_.domain;

public class Fm {
    private String id;
    private String gequ;
    private String jianjie;
    private String geshou;
    private String geimage;
    private String jjimage;
    private String a;

    public Fm() {
    }

    public Fm(String id, String gequ, String jianjie, String geshou, String geimage, String jjimage, String a) {
        this.id = id;
        this.gequ = gequ;
        this.jianjie = jianjie;
        this.geshou = geshou;
        this.geimage = geimage;
        this.jjimage = jjimage;
        this.a = a;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGequ() {
        return gequ;
    }

    public void setGequ(String gequ) {
        this.gequ = gequ;
    }

    public String getJianjie() {
        return jianjie;
    }

    public void setJianjie(String jianjie) {
        this.jianjie = jianjie;
    }

    public String getGeshou() {
        return geshou;
    }

    public void setGeshou(String geshou) {
        this.geshou = geshou;
    }

    public String getGeimage() {
        return geimage;
    }

    public void setGeimage(String geimage) {
        this.geimage = geimage;
    }

    public String getJjimage() {
        return jjimage;
    }

    public void setJjimage(String jjimage) {
        this.jjimage = jjimage;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }
}
