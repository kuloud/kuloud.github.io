---
layout: post
title:  "Github Actions 在持续集成的应用"
date:   2022-03-21 14:07:35 +0800
categories: development github
---

### 持续集成的概念

> 持续集成(Continuous Integration,简称 CI）是一种软件开发实践，即团队开发成员经常集成他们的工作，每次集成都通过自动化的构建（包括编译，发布，自动化测试）来验证，从而尽早地发现集成错误。

简单来说：自动化集成并验证每一次代码提交。

### 持续集成的模式

![](https://cdn-images-1.medium.com/max/800/0*Ibsu7Nvvd9gyhHxO.png)

`CI` 非常适合多人团队协作开发，每一次小改动集成，能保证在第一时间回归验证，帮助错误被快速发现，对个人独立开发来说，通过一次简单的配置，摆脱远程服务的代码同步、服务部署这样繁琐重复的操作，也是不错的选择。

### 持续集成的优点

1. **快速发现集成错误**，每完成一点更新，就集成到主干，可以快速发现和定位错误
1. **防止分支大幅偏离主干**，如果不是经常集成，主干又在不断更新，会导致以后集成的难度变大，冲突多甚至难以集成

通过自动化测试验证每次代码的提交，并及时解决集成错误，以 **保证代码保持高质量，随时可交付**

### 持续集成服务的选择

比较完善成熟的持续集成服务有很多，最流行的有 `Jenkins`、`Travis CI`，它们需要在自己服务器上进行配置安装，上手使用需要找找文档，按操作步骤构建服务。

#### 为什么使用 Github Actions?

或者说什么场景适合使用 Github Actions：

如果你的项目托管在 Github 上，Actions ~~几乎~~ 是最简单也是最优方案，免费、灵活定制，连服务器也无需准备，稍微了解一下 Actions 的语法，可以结合自己的服务集群做持续部署。


### 如何使用 Github Actions


### 总结

### 参考链接：

[1] [Continuous Integration: A "Typical" Process](https://developers.redhat.com/blog/2017/09/06/continuous-integration-a-typical-process)