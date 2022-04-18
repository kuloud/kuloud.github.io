---
layout: post
title:  "[算法] 阶段总结"
date:   2022-04-16 16:31:00 +0800
categories: algorithm

---

最近刷了不少算法题，积攒了一点手感，但是遇到没见过的题型基本就卡壳，说到底对算法背后的原理理解还是比较差，没有真正掌握。

整理一下，争取覆盖到大部分题型，其他的只能看运气了。

### 题型
1. 基本数据结构
    1. 排序
        1. [977. 有序数组的平方](https://leetcode-cn.com/problems/squares-of-a-sorted-array/solution/by-kuloud-v-3wp5/)
    1. 并归
    1. 查找
        1. [167. 两数之和 II - 输入有序数组](https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/solution/by-kuloud-v-u2kw/)
        1. [74. 搜索二维矩阵](https://leetcode-cn.com/problems/search-a-2d-matrix/solution/by-kuloud-v-ekjg/)
        1. [33. 搜索旋转排序数组](https://leetcode-cn.com/problems/search-in-rotated-sorted-array/solution/33-sou-suo-xuan-zhuan-pai-xu-shu-zu-by-k-gimm/)
        1. [18. 四数之和](https://leetcode-cn.com/problems/4sum/solution/18-si-shu-zhi-he-by-kuloud-v-exv5/)
    1. 树
        1. [116. 填充每个节点的下一个右侧节点指针](https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node/solution/116-tian-chong-mei-ge-jie-dian-de-xia-yi-7fyx/)
        1. [617. 合并二叉树](https://leetcode-cn.com/problems/merge-two-binary-trees/solution/617-he-bing-er-cha-shu-by-kuloud-v-7rka/)
    1. 哈希表
    1. 栈
    1. 队列
    1. 列表
        1. [189. 轮转数组](https://leetcode-cn.com/problems/rotate-array/solution/189-lun-zhuan-shu-zu-by-kuloud-v-ko6o/)
        1. [283. 移动零](https://leetcode-cn.com/problems/move-zeroes/solution/283-yi-dong-ling-by-kuloud-v-aw7y/)
    1. 链表
        1. [876. 链表的中间结点](https://leetcode-cn.com/problems/middle-of-the-linked-list/solution/by-kuloud-v-jdau/)
        1. [19. 删除链表的倒数第 N 个结点](https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/solution/by-kuloud-v-ljfd/)
    1. 图
        1. 深度优先搜索
            1. [695. 岛屿的最大面积](https://leetcode-cn.com/problems/max-area-of-island/solution/695-dao-yu-de-zui-da-mian-ji-by-kuloud-v-dcqr/)
            1. [733. 图像渲染](https://leetcode-cn.com/problems/flood-fill/solution/733-tu-xiang-xuan-ran-by-kuloud-v-dcrj/)
    1. 字符串
        1. [567. 字符串的排列](https://leetcode-cn.com/problems/permutation-in-string/solution/567-zi-fu-chuan-de-pai-lie-by-kuloud-v-8fa5/)
        1. [面试题 01.05. 一次编辑](https://leetcode-cn.com/problems/one-away-lcci/solution/mian-shi-ti-0105-yi-ci-bian-ji-by-kuloud-k7x5/)
    1. 数字与位运算
        1. [剑指 Offer II 001. 整数除法](https://leetcode-cn.com/problems/xoh6Oh/solution/by-kuloud-v-perd/)
        1. [231. 2 的幂](https://leetcode-cn.com/problems/power-of-two/solution/231-2-de-mi-by-kuloud-v-4vo9/)
    1. 矩阵问题

1. K值问题

1. 动态规划
    1. [198. 打家劫舍](https://leetcode-cn.com/problems/house-robber/solution/198-da-jia-jie-she-by-kuloud-v-5ouk/)
    1. [120. 三角形最小路径和](https://leetcode-cn.com/problems/triangle/solution/by-kuloud-v-y4bm/)
    1. [322. 零钱兑换](https://leetcode-cn.com/problems/coin-change/solution/by-kuloud-v-ll03/)

1. 贪心算法

    保证每次操作都是局部最优的，从而使最后得到的结果是全局最优的。
    1. 分配问题

1. 回溯算法

1. 索引滑窗
    1. [162. 寻找峰值](https://leetcode-cn.com/problems/find-peak-element/solution/162-xun-zhao-feng-zhi-by-kuloud-v-n8m0/)


1. 求和问题

1. NP问题
    1. [416. 分割等和子集](https://leetcode-cn.com/problems/partition-equal-subset-sum/solution/by-kuloud-v-ew0i/)

1. 双指针
    1. [82. 删除排序链表中的重复元素 II](https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/solution/82-shan-chu-pai-xu-lian-biao-zhong-de-zh-mwt0/)
    1. [986. 区间列表的交集](https://leetcode-cn.com/problems/interval-list-intersections/solution/986-qu-jian-lie-biao-de-jiao-ji-by-kulou-eyht/)
    1. [11. 盛最多水的容器](https://leetcode-cn.com/problems/container-with-most-water/solution/11-sheng-zui-duo-shui-de-rong-qi-by-kulo-5t2f/)
    1. [21. 合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists/solution/21-he-bing-liang-ge-you-xu-lian-biao-by-dcrun/)



# 总结

上面题型的划分多是按数据结构整理，具体题型的解法有很多种，按具体case分类总会有套娃的情况，分类不是很严谨，比如NP问题，比较常规的处理是动态规划。

感觉 `索引滑窗` 和 `动态规划` 是比较常见的两个题型，而滑窗问题通常也要配合 `二分` 实现log(n) 的时间效率优化，需要格外注意索引越界、滑窗步骤；动态规划有较强的范式，难点在于问题抽象成数学公式，`双人对弈`类，`0-1背包`类的问题是典型的动态规划问题，面试时不要慌了阵脚，沉着分析；

再就是 `混序数组` 重排也是一种常见题型，这类题型，一般都需要直接先排序，然后观察传递的规律，自下而上倒推；

`链表` 的查找问题，一般是配合数组、HashMap，维护一个 `类索引` 的映射关系，涉及反转问题时，需要多注意next指针的判空和传递方向指针处理，个人认为 `链表`和`树`是比较容易考到的，其他题型比较好背，或者临场梳理逻辑还能尝试一下，双指针的处理逻辑不清晰，这块基本会卡，这块要重点关注，面试前再 review 一下；





