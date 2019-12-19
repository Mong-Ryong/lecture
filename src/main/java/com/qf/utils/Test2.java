package com.qf.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Test2 {
    public static void main(String[] args) {
        //1.工厂类实例对象
        // MyThreadFactory factory = new MyThreadFactory("MyThreadFactory");

        //2.创建一个包含固定数量的线程池对象
        ExecutorService executorService = Executors.newFixedThreadPool(2, Executors.defaultThreadFactory());

        //3.创建Runnable实例对象
        Thread r = new Thread(new ThreadPool());

        //控制要创建的线程数
        /*Thread thread = null;
        for(int i = 0; i < 5; i++) {Executors.defaultThreadFactory()
            thread = factory.newThread(r);
            thread.start();
        }*/

        Executors.newFixedThreadPool(2,Executors.defaultThreadFactory());

        //4.提交Runnable接口子类对象
        executorService.submit(r);
        executorService.submit(r);
        executorService.submit(r);

        System.out.printf("Factory stats:\n");
        //System.out.printf("%s\n",factory.getStas());

        //5.关闭线程池
        //executorService.shutdown();



    }

}


