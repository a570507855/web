package com;

import java.math.BigDecimal;

public class BaseMethod {

    private static BaseMethod instance;

    private BaseMethod(){

    }

    public static BaseMethod getInstance(){
        if(instance == null){
            instance = new BaseMethod();
        }
        return instance;
    }

    //判断是否是数字
    public  boolean isNumer(String str) {
        String bigStr;
        try {
            bigStr = new BigDecimal(str).toString();
        } catch (Exception e) {
            return false;//异常 说明包含非数字。
        }
        return true;
    }
}