---
layout: post
title:  "【算法题】156. 上下翻转二叉树"
date:   2022-03-29 22:41:00 +0800
categories: project

---

### 题目：

给你一个二叉树的根结点 root ，请你将此二叉树上下翻转，并返回新的根结点。

你可以按下面的步骤翻转一棵二叉树：

1. 原来的左子结点变成新的根结点
1. 原来的根结点变成新的右子结点
1. 原来的右子结点变成新的左子结点

![](https://assets.leetcode.com/uploads/2020/08/29/main.jpg)

上面的步骤逐层进行。题目数据保证每个右结点都有一个同级结点（即共享同一父结点的左结点）且不存在子结点。

 

示例 1：
![](https://assets.leetcode.com/uploads/2020/08/29/updown.jpg)

{% highlight bash %}
输入：root = [1,2,3,4,5]
输出：[4,5,2,null,null,3,1]
{% endhighlight %}

示例 2：
{% highlight bash %}
输入：root = []
输出：[]
{% endhighlight %}

示例 3：

{% highlight bash %}
输入：root = [1]
输出：[1]
 {% endhighlight %}

提示：

树中结点数目在范围 [0, 10] 内

1 <= Node.val <= 10

树中的每个右结点都有一个同级结点（即共享同一父结点的左结点）
树中的每个右结点都没有子结点

```
来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/binary-tree-upside-down
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
```

### 解题：
根据题目观察有特性：

二叉树为“左边挂”，有明显左边递归的特性，n级子树完成旋转后，n-1级子树的旋转规则为，原n-1级根结点和其左右子结点的转换

于是基本思路是，保存左子结点的引用，对子结点递归旋转，之后完成当前结点与左右结点的转换。

需要注意的是，左子结点作为根结点旋转完后，先把右子结点做转换，然后原root结点变成了没有子结点的左子结点，这里需要理顺引用的处理顺序，不然容易空指针或循环引用。

{% highlight java %}
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public TreeNode upsideDownBinaryTree(TreeNode root) {
        if (null != root && null != root.left) {
            TreeNode top = root.left;
            TreeNode nRoot = upsideDownBinaryTree(top);

            top.left = root.right;
            root.left = null;
            root.right = null;
            top.right = root;
            
            return nRoot;
        }

        return root;
    }
}
 {% endhighlight %}

