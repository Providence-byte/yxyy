package com.dao_.domain;

public class Location {
    private  String postcode;
    private  String placeName;

    public Location() {
    }

    public Location(String postcode, String placeName) {
        this.postcode = postcode;
        this.placeName = placeName;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }
}
