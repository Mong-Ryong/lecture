package com.qf.utils;

public class ThreadPool implements Runnable {
    @Override
    public void run() {
        System.out.println("网管，给我找台机子");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName()+"千锋网咖欢迎您，已为您准备好18号机，祝您游戏愉快！");
        System.out.println("本次18号机服务时间已结束，欢迎继续充值使用。");
    }
}
