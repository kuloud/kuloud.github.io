---
layout: post
title:  "[Android] 虚拟机"
date:   2022-04-18 08:31:00 +0800
categories: android

---
Java 文件执行流程：

![](https://media.geeksforgeeks.org/wp-content/uploads/20210218150010/JDK.png)

> JDK > JRE > JVM

JDK，Java Development Kit 是 Java 开发套件，包含了 JRE 和 Java 开发所需工具库，以及 Java 源码等。

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
![](https://raw.githubusercontent.com/kuloud/fly-img/main/img/20220418161355.png)

1. 类加载器子系统

    当他在运行时（不是编译时），首次引用一个类时，它加载、链接并初始化该类文件（.class文件）
    1. 加载

        加载过程由下面三个加载器实现：
        1. 启动类加载器（BootStrap Class Loader）

            负责从启动类路径中加载类，无非就是rt.jar。这个加载器会被赋予最高优先级。
        1. 拓展类加载器（Extension Class Loader）
        1. 应用程序类加载器（Application Class Loader）

        这三个类加载器会遵循委托层次算法(Delegation Hierarchy Algorithm)加载类文件。
        ![](https://media.geeksforgeeks.org/wp-content/uploads/jvmclassloader.jpg)
    1. 链接

        1. 校验

            字节码校验器会校验生成的字节码是否正确，如果校验失败，则得到校验错误。

        1. 准备

            分配内存并初始化默认值给所有的静态变量。

        1. 解析

            所有符号内存引用被方法区（Method Area）的原始引用所替代。

    1. 初始化

        这是类加载的最后阶段，这里所有的静态变量会赋初始值，并且静态块将被执行。

1. 运行时数据区
1. 执行引擎、 Java 本地库接口 （JNI）和本地库

### 参考链接：

[1] [【朝花夕拾】Android性能篇之（一）序言及JVM](https://www.cnblogs.com/andy-songwei/p/9739836.html)

[2] [ClassLoader in Java](https://www.geeksforgeeks.org/classloader-in-java/)