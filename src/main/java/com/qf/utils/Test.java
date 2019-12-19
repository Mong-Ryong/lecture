package com.qf.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Test {
    public static void main(String[] args) {
        //1.创建一个包含固定数量的线程池对象
        ExecutorService executorService = Executors.newFixedThreadPool(2);

        //2.创建Runnable实例对象
        Thread r = new Thread(new ThreadPool());

        Executors.newFixedThreadPool(2);

        //3.提交Runnable接口子类对象
        executorService.submit(r);
        executorService.submit(r);
        executorService.submit(r);

        //4.关闭线程池
        //executorService.shutdown();
    }
}
