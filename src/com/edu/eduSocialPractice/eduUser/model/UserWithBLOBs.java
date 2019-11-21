package com.edu.eduSocialPractice.eduUser.model;

public class UserWithBLOBs extends User {
    private String shortcut;

    private String myRss;

    private String remark;

    private String userPara;

    public String getShortcut() {
        return shortcut;
    }

    public void setShortcut(String shortcut) {
        this.shortcut = shortcut == null ? null : shortcut.trim();
    }

    public String getMyRss() {
        return myRss;
    }

    public void setMyRss(String myRss) {
        this.myRss = myRss == null ? null : myRss.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getUserPara() {
        return userPara;
    }

    public void setUserPara(String userPara) {
        this.userPara = userPara == null ? null : userPara.trim();
    }
}