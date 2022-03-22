---
layout: post
title:  "CentOS7 安装配置 MySQL"
date:   2022-03-22 14:28:35 +0800
categories: development mysql
---

### 安装MySql

{% highlight bash %}
yum -y install mysql mysql-server mysql-devel
{% endhighlight %}

正常情况会报错：
{% highlight bash %}
Failed to start mysql.server.service: Unit not found.
{% endhighlight %}

原因：

甲骨文公司收购了 MySQL 后，有将MySQL闭源的潜在风险，因此社区采用分支的方式来避开这个风险，对应的产物就是MariaDB，采用GPL授权许可。

解决：

使用 MariaDB 代替 mysql 数据库

{% highlight bash %}
yum install mariadb-server -y // 如果已安装可以省略
systemctl start mariadb.service // 启动服务
systemctl enable mariadb.service // 开机启动服务
mysql -u root -p // 登录mysql，第一次安装时直接回车进入 MariaDB 终端
{% endhighlight %}

进入MySQL控制台后，可以对用户设置密码，如下对用户 root 设置密码 123456:

{% highlight sql %}
UPDATE mysql.user SET password = PASSWORD('123456') WHERE user = 'root';
FLUSH PRIVILEGES;
{% endhighlight %}


### 参考链接：

[1] [【linux系列】Centos下安装mysql数据库](https://blog.51cto.com/u_9955199/3226094)