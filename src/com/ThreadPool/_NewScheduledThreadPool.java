package com.ThreadPool;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/***
 * 定长线程池，支持定时及周期性任务执行
 */
public class _NewScheduledThreadPool implements Runnable{

    @Override
    public void run() {
        for(int i = 0;i!=50;++i){
            System.out.println(Thread.currentThread().getName() + ":" + i);
        }
    }
    public static void main(String[] args){
        ScheduledExecutorService scheduledThreadPool = Executors.newScheduledThreadPool(5);
        _NewScheduledThreadPool newScheduledThreadPool = new _NewScheduledThreadPool();
        //scheduledThreadPool.schedule(newScheduledThreadPool,0, TimeUnit.SECONDS);//3秒后执行
        scheduledThreadPool.scheduleAtFixedRate(newScheduledThreadPool,1,5, TimeUnit.SECONDS);//1秒后执行，然后每隔5秒执行一次
        //scheduledThreadPool.shutdown();
    }
}