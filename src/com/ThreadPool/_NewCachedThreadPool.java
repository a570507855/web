package com.ThreadPool;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/***
 * 创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程
 */
public class _NewCachedThreadPool implements Runnable{

    private int num = 0;
    _NewCachedThreadPool(int num){
        this.num = num;
    }

    @Override
    public void run(){
        for(int i = 0;i!=num;++i){
            System.out.println(Thread.currentThread().getName() + "正在运行！！！" + i);
        }

    }

    public static void main(String[] args){
        ExecutorService cachedThreadPool = Executors.newCachedThreadPool();
        _NewCachedThreadPool newCachedThreadPool = new _NewCachedThreadPool(5);
        _NewCachedThreadPool newCachedThreadPool2 = new _NewCachedThreadPool(20);
        _NewCachedThreadPool newCachedThreadPool3 = new _NewCachedThreadPool(50);
        _NewCachedThreadPool newCachedThreadPool4 = new _NewCachedThreadPool(100);
        _NewCachedThreadPool newCachedThreadPool5 = new _NewCachedThreadPool(200);

        //execute用于提交不需要返回值的任务
        //submit用于提交需要返回值的任务
        cachedThreadPool.execute(newCachedThreadPool);
        cachedThreadPool.execute(newCachedThreadPool2);
        cachedThreadPool.execute(newCachedThreadPool3);
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        cachedThreadPool.execute(newCachedThreadPool4);

        cachedThreadPool.execute(newCachedThreadPool5);



        cachedThreadPool.shutdown();
    }
}
