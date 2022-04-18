---
layout: post
title:  "[Android] 虚拟机"
date:   2022-04-18 08:31:00 +0800
categories: android

---
Java 文件执行流程：

![](https://images2018.cnblogs.com/blog/472002/201807/472002-20180726185841044-1267282086.png)

> JDK > JRE > JVM

JDK，Java Development Kit 是 Java 开发套件，包含了 JRE 和 Java 开发所需类库，Java 与 JVM 交互的头文件，以及 Java 源码等。

JRE，Java Runtime Environment 是 Java 运行时环境，包含了 Java bin 里的各种程序和 lib 依赖类库。

JVM 包含 Java 解释器和编译器以及运行时系统（java.exe），用来执行.class文件

### JVM 生命周期

一个 JVM 实例对应一个独立 Java 程序

1. 启动

    当一个 Java 程序启动时，就产生一个 JVM 实例，每个拥有 main 的 .class 都可以作为 JVM 实例运行的起点。

2. 运行

    main 函数作为起点，启动主线程，其他线程都在该线程中启动。 JVM 线程有两种： User Thread（用户线程）和Daemon Thread（守护线程：为用户线程服务的线程），main() 线程为用户线程，而守护线程通常由 JVM 自己使用。

3. 消亡

    程序中所有用户线程都终止时，JVM才会退出。若安全管理器允许，程序


### JVM架构
![](https://images2018.cnblogs.com/blog/472002/201807/472002-20180726184123382-315796575.png)


### 参考链接：

[1] [【朝花夕拾】Android性能篇之（一）序言及JVM](https://www.cnblogs.com/andy-songwei/p/9739836.html)