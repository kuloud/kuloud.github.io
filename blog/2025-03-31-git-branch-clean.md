---
outline: deep
---

在 Git 中，可以通过以下步骤清除本地的过期分支，从而减少磁盘占用：

### 1. **删除已被合并到 `main` 或 `master` 的本地分支**
运行以下命令来删除已被合并到当前分支（例如 `main` 或 `master`）的本地分支：
```bash
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
```
**说明：**
- `git branch --merged`：列出已合并到当前分支的分支。
- `grep -v "\*"`：排除当前分支。
- `xargs -n 1 git branch -d`：逐个删除已合并的分支。

### 2. **删除远程已删除的本地分支**
如果远程仓库的分支已被删除，您可以通过以下命令清除本地的跟踪分支：
```bash
git fetch --prune
```
**说明：**
- `--prune` 参数会清除本地仓库中所有已删除的远程分支的引用。

### 3. **删除指定的过期分支**
如果知道具体的分支名称，可以使用以下命令删除本地分支：
```bash
git branch -d 分支名   # 删除已合并的分支
git branch -D 分支名   # 强制删除未合并的分支
```

### 4. **清理 Git 仓库中的其他无用数据**
运行以下命令清理无用的对象和优化仓库大小：
```bash
git gc --prune=now --aggressive
```
**说明：**
- `git gc`（Garbage Collection）：清理未使用的对象（如已删除的分支对应的对象）。
- `--prune=now`：立即删除过期对象。
- `--aggressive`：进一步压缩和优化存储。

### 5. **总结**
- 定期清理已合并的本地分支。
- 使用 `git fetch --prune` 清理远程已删除的分支。
- 使用 `git gc` 清理无用的仓库数据。
