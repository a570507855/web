package com.Thread;

import java.util.ArrayList;

/***
 * 通过Runable接口创建线程类
 */
public class Thread_two implements Runnable {


    @Override
    public void run() {
        ArrayList<Integer> list = new ArrayList<Integer>();

        list.add(0,5);
        list.add(1,56);
        list.add(2,456);
        list.add(3,21);
        list.add(4,78);
        list.add(5,34);

        for(Integer i : list){
            System.out.println(i);
        }

    }

    public static void main(String[] args){
        Thread_two thread_two = new Thread_two();

        Thread thread = new Thread(thread_two,"第二个");
        thread.start();
        thread.getThreadGroup();
    }
}
