package com.Thread;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

/***
 * 通过Callable和FutureTask创建线程
 * 有返回值的线程
 */
public class Thread_three implements Callable<Integer> {
    @Override
    public Integer call() throws Exception {
        int i = 0;
        for(;i<100;i++)
        {
            System.out.println(Thread.currentThread().getName()+" "+i);
        }
        return i;
    }

    public static void main(String[] args){
        Thread_three thread_three = new Thread_three();
        FutureTask<Integer> ft = new FutureTask<>(thread_three);
        try {
            for(int i = 0;i < 20;i++)
            {
                System.out.println(Thread.currentThread().getName()+" 的循环变量i的值"+i);
                if(i==5)
                {
                    new Thread(ft,"有返回值的线程").start();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            System.out.println("值返回前");
            System.out.println("子线程的返回值:" + ft.get());
            System.out.println("值返回后");
        } catch (ExecutionException | InterruptedException e) {
            e.printStackTrace();
        }

    }
}
