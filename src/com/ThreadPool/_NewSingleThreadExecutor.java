package com.ThreadPool;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/***
 * 单线程化的线程池 只会用唯一的工作线程来执行任务，保证所有任务按照指定顺序(FIFO, LIFO, 优先级)执行
 */
public class _NewSingleThreadExecutor implements Runnable {
    @Override
    public void run() {
        for (int i =0 ; i!=50;++i){
            System.out.println(Thread.currentThread().getName() + ":" + i);
        }
    }

    public static void main(String[] args){
        ExecutorService singleThreadExecutor = Executors.newSingleThreadExecutor();
        _NewSingleThreadExecutor newSingleThreadExecutor = new _NewSingleThreadExecutor();
        _NewSingleThreadExecutor newSingleThreadExecutor2 = new _NewSingleThreadExecutor();
        _NewSingleThreadExecutor newSingleThreadExecutor3 = new _NewSingleThreadExecutor();
        singleThreadExecutor.execute(newSingleThreadExecutor);
        singleThreadExecutor.execute(newSingleThreadExecutor2);
        singleThreadExecutor.execute(newSingleThreadExecutor3);

        singleThreadExecutor.shutdown();
//        for (int i = 0; i < 10; i++) {
//            final int index = i;
//            singleThreadExecutor.execute(new Runnable() {
//
//                @Override
//                public void run() {
//                    try {
//                        System.out.println(Thread.currentThread().getName() + ":" + index);
//                        Thread.sleep(2000);
//                    } catch (InterruptedException e) {
//                        // TODO Auto-generated catch block
//                        e.printStackTrace();
//                    }
//                }
//            });
//        }

    }
}
