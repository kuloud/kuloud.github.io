---
layout: post
title:  "Nginx 配置详解"
date:   2022-03-24 10:07:35 +0800
categories: development github
extra-support: feature-tabs.html
---

{% if page.extra-support %}
  {% include {{ page.extra-support }} %}
{% endif %}

### 安装

{% tabs install%}

{% tab install CentOS %}
{% highlight bash %}
yum install nginx
{% endhighlight %}
{% endtab %}

{% tab install Ubuntu %}
{% highlight bash %}
apt install nginx
{% endhighlight %}
{% endtab %}

{% tab install MacOS %}
{% highlight bash %}
brew install nginx 
{% endhighlight %}
{% endtab %}

{% endtabs %}

默认情况下，nginx被安装在 /etc/nginx 目录下

### 使用
常用基本命令
{% highlight bash %}
nginx -s reopen # 重启Nginx
nginx -s reload # 重新加载Nginx配置文件，然后以优雅的方式重启Nginx
nginx -s stop # 强制停止Nginx服务
nginx -s quit # 优雅地停止Nginx服务（即处理完所有请求后再停止服务）
nginx -t # 检测配置文件是否有语法错误，然后退出
nginx -?,-h # 打开帮助信息
nginx -v # 显示版本信息并退出
nginx -V # 显示版本和配置选项信息，然后退出
nginx -t # 检测配置文件是否有语法错误，然后退出
nginx -T # 检测配置文件是否有语法错误，转储并退出
killall nginx # 杀死所有nginx进程
{% endhighlight %}

### 配置

### 总结

### 参考链接：

[1] [Continuous Integration: A "Typical" Process](https://developers.redhat.com/blog/2017/09/06/continuous-integration-a-typical-process)