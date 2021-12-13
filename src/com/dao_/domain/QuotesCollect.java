package com.dao_.domain;

import java.util.Date;

public class QuotesCollect {
    private String quoteId;
    private String userId;
    private String publishTime;
    private String qpublic;
    private String qtype;
    private String likeNum;
    private String collectNum;
    private String content;
    private String img;
    private String caption;
    private Date collectTime;
    private String hotindex;

    public QuotesCollect() {
    }

    public QuotesCollect(String quoteId, String userId, String publishTime, String qpublic, String qtype, String likeNum, String collectNum, String content, String img, String caption, Date collectTime, String hotindex) {
        this.quoteId = quoteId;
        this.userId = userId;
        this.publishTime = publishTime;
        this.qpublic = qpublic;
        this.qtype = qtype;
        this.likeNum = likeNum;
        this.collectNum = collectNum;
        this.content = content;
        this.img = img;
        this.caption = caption;
        this.collectTime = collectTime;
        this.hotindex = hotindex;
    }

    public String getQuoteId() {
        return quoteId;
    }

    public void setQuoteId(String quoteId) {
        this.quoteId = quoteId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public String getQpublic() {
        return qpublic;
    }

    public void setQpublic(String qpublic) {
        this.qpublic = qpublic;
    }

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }

    public String getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(String likeNum) {
        this.likeNum = likeNum;
    }

    public String getCollectNum() {
        return collectNum;
    }

    public void setCollectNum(String collectNum) {
        this.collectNum = collectNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }

    public String getHotindex() {
        return hotindex;
    }

    public void setHotindex(String hotindex) {
        this.hotindex = hotindex;
    }

}
