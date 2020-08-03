package com.ThreadPool;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/***
 * 创建一个定长线程池，可控制线程最大并发数，超出的线程会在队列中等待
 */
public class _NewFixedThreadPool implements Runnable {
    private int num = 0;

    _NewFixedThreadPool(int num){
        this.num = num;
    }

    @Override
    public void run() {
        for(int i = 0;i!=num;++i){
            System.out.println(Thread.currentThread().getName() + ":" + i);
        }
    }

    public static void main(String[] args){
        //可用处理器的Java虚拟机的数量
        System.out.println(Runtime.getRuntime().availableProcessors());
        ExecutorService fixedThreadPool = Executors.newFixedThreadPool(7);
        _NewFixedThreadPool newFixedThreadPool = new _NewFixedThreadPool(5);
        _NewFixedThreadPool newFixedThreadPool2 = new _NewFixedThreadPool(20);
        _NewFixedThreadPool newFixedThreadPool3 = new _NewFixedThreadPool(50);
        _NewFixedThreadPool newFixedThreadPool4 = new _NewFixedThreadPool(50);
        _NewFixedThreadPool newFixedThreadPool5 = new _NewFixedThreadPool(50);
        _NewFixedThreadPool newFixedThreadPool6 = new _NewFixedThreadPool(50);
        _NewFixedThreadPool newFixedThreadPool7 = new _NewFixedThreadPool(50);
        fixedThreadPool.execute(newFixedThreadPool);
        fixedThreadPool.execute(newFixedThreadPool2);
        fixedThreadPool.execute(newFixedThreadPool3);
        fixedThreadPool.execute(newFixedThreadPool4);
        fixedThreadPool.execute(newFixedThreadPool5);
        fixedThreadPool.execute(newFixedThreadPool6);
        fixedThreadPool.execute(newFixedThreadPool7);

        fixedThreadPool.shutdown();
    }
}
