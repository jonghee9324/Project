package com.example.moble_porject;

public class Cardinfo {
    private boolean click;

    /* renamed from: id */
    private int f2id;
    private int imgresources;

    public Cardinfo(int imgres, int id) {
        this.imgresources = imgres;
        this.f2id = id;
        this.click = false;
    }

    public Cardinfo() {
        this(-1, -1);
    }

    public int getImgresources() {
        return this.imgresources;
    }

    public void setImgresources(int imgresources2) {
        this.imgresources = imgresources2;
    }

    public int getId() {
        return this.f2id;
    }

    public void setId(int id) {
        this.f2id = id;
    }

    public boolean getClick() {
        return this.click;
    }

    public void setClick(boolean click2) {
        this.click = click2;
    }
}
