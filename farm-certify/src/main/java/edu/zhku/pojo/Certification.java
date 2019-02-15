package edu.zhku.pojo;

public class Certification {
    private Integer id;

    private String url;

    private Integer status;

    private byte[] mid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public byte[] getMid() {
        return mid;
    }

    public void setMid(byte[] mid) {
        this.mid = mid;
    }
}