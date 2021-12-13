package com.dao_.domain;

public class User {//userId,userName,password,sex,age,email,phoneNum,signature,nickName,address,head
    private String userId;
    private String userName;
    private String password;
    private String sex;
    private String age;
    private String email;
    private String phoneNum;
    private String signature;
    private String nickName;
    private String address;
    private String head;
    private String visits;
    private String root;

    public void Xg(String head,String nickName,String signature,String age,String phoneNum,String sex,String address){
        this.head=head;
        this.nickName=nickName;
        this.signature=signature;
        this.age=age;
        this.phoneNum=phoneNum;
        this.sex=sex;
        this.address=address;
    }

    public User() {
    }

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public User(String userName, String password, String email) {
        this.userName = userName;
        this.password = password;
        this.email = email;
    }

    public User(User user) {
        this.userId = user.getUserId();
        this.userName = user.getUserName();
        this.password = user.getPassword();
        this.sex = user.getSex();
        this.age = user.getAge();
        this.email = user.getEmail();
        this.phoneNum = user.getPhoneNum();
        this.signature = user.getSignature();
        this.nickName = user.getNickName();
        this.address = user.getAddress();
        this.head = user.getHead();
        this.visits= user.getVisits();
        this.root= user.getRoot();
    }

    public User(String userId, String userName, String password, String sex, String age, String email, String phoneNum, String signature, String nickName, String address, String head) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.sex = sex;
        this.age = age;
        this.email = email;
        this.phoneNum = phoneNum;
        this.signature = signature;
        this.nickName = nickName;
        this.address = address;
        this.head = head;
    }

    public User(String userId, String userName, String password, String sex, String age, String email, String phoneNum, String signature, String nickName, String address, String head, String visits) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.sex = sex;
        this.age = age;
        this.email = email;
        this.phoneNum = phoneNum;
        this.signature = signature;
        this.nickName = nickName;
        this.address = address;
        this.head = head;
        this.visits = visits;
    }

    public User(String userId, String userName, String password, String sex, String age, String email, String phoneNum, String signature, String nickName, String address, String head, String visits, String root) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.sex = sex;
        this.age = age;
        this.email = email;
        this.phoneNum = phoneNum;
        this.signature = signature;
        this.nickName = nickName;
        this.address = address;
        this.head = head;
        this.visits = visits;
        this.root = root;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getVisits() {
        return visits;
    }

    public void setVisits(String visits) {
        this.visits = visits;
    }

    public String getRoot() {
        return root;
    }

    public void setRoot(String root) {
        this.root = root;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", root='" + root + '\'' +
                '}';
    }
}
