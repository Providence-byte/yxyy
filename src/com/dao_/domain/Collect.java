package com.dao_.domain;

import java.util.Date;

public class Collect {
    private String userId;
    private String quoteId;
    private Date collectTime;

    public Collect() {
    }

    public Collect(String userId, String quoteId, Date collectTime) {
        this.userId = userId;
        this.quoteId = quoteId;
        this.collectTime = collectTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getQuoteId() {
        return quoteId;
    }

    public void setQuoteId(String quoteId) {
        this.quoteId = quoteId;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }
}
