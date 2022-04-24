---
layout: post
title:  "[Android] 源码梳理"
date:   2022-04-20 08:31:00 +0800
categories: android

---

### Activity 启动

- Activity.stratActivity

    - IActivityManager.startActivityForResult

        - ActivityStarter

            - ActivityStackSuperVisor

                - 冷启动 ZygoteProcess Socket 连接 ZygoteService fork ApplicationThread
                - 热启动 ApplicationThread 