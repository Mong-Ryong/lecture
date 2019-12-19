package com.qf.utils;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ThreadFactory;


//在创建线程的同时，记录线程创建的个数，并记录每个线程创建的时间等信息
public class MyThreadFactory implements ThreadFactory {
    private int counter;
    private String name;
    private List<String> stats;

    //线程名
    public MyThreadFactory(String name){
        counter = 0;
        this.name = name;
        stats = new ArrayList<String>();
    }

    //记录线程创建的个数，并记录每个线程创建的时间等信息
    @Override
    public Thread newThread(Runnable run) {
        Thread t = new Thread(run, name + "-Thread-" + counter);
        counter++;
        stats.add(String.format("Created thread %d with name %s on%s\n" ,t.getId() ,t.getName() ,new Date()));
        return t;
    }

    //计数器
    public String getStas(){
        StringBuffer buffer = new StringBuffer();
        Iterator<String> it = stats.iterator();
        while (it.hasNext()){
            buffer.append(it.next());
        }
        return buffer.toString();
    }
}
