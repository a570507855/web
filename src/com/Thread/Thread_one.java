package com.Thread;

/****
 * 继承Thread类创建线程类
 */
public class Thread_one extends Thread {

    Thread_one(){}

    Thread_one(String name){
        this.setName(name);
    }

    public void run(){
        int[] intArr = {10,9,12,49,126,8,163,485};
        System.out.println(this.getName() + ":");
        for (int i : intArr) {
            System.out.print(i + " ");
        }
        System.out.println();
    }

    public static void main(String[] args){
        Thread_one thread_one = new Thread_one("第一个");
        thread_one.start();
    }
}
