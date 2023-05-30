---
title: "BuildConfig"
date: 2023-05-27T08:45:46+08:00
weight: 1
tags: Gradle
---

新建 Android 工程，发现不会自动构建 `BuildConfig` 类，于是找了下 `gradle 8.0` 的[文档](https://developer.android.com/reference/tools/gradle-api/8.0/com/android/build/api/dsl/BuildFeatures#buildConfig())

确实从 8.0 开始，Gradle 把 buildConfig 的默认属性改为了 `false`

---

buildConfig
```kotlin
var buildConfig: Boolean?
```
Flag to enable/disable generation of the BuildConfig class.

Setting the value to null resets to the default value. Default value is false.
