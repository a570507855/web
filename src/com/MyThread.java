package com;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class MyThread implements Runnable {

    static int count = 10;
    private Lock lock = new ReentrantLock();
    public static MyThread instance;


    public MyThread(){
    }

    public void run(){
        while (count>0) {
            try {
                lock.lock();
                if(count<=0) {
                    System.out.println(Thread.currentThread().getName() + "售票结束！！！");
                    return;
                }
                System.out.println(Thread.currentThread().getName() + "售出" + count + "票");
                count--;


            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }

            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }
        System.out.println(Thread.currentThread().getName() + "售票结束！！！");
    }

    public static void main(String[] args) throws InterruptedException {

        MyThread sell = new MyThread();

        Thread thread_one = new Thread(sell,"一号窗口");
        Thread thread_two = new Thread(sell,"二号窗口");
        Thread thread_three = new Thread(sell,"三号窗口");
        Thread thread_four = new Thread(sell,"四号窗口");
        thread_one.start();
        thread_two.start();
        thread_three.start();
        thread_four.start();
    }
}
