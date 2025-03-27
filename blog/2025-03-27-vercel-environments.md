---
outline: deep
---

### **一、Vercel 多环境变量配置**
#### **1. 在 Vercel 控制台添加环境变量**
• **生产环境（Production）**：  
  进入 Vercel 项目 → 「Settings」→ 「Environment Variables」→ 选择 **Production** 环境，手动添加 `.env.production` 中的变量。  
  *示例*：  
  ```plaintext
  Key: NEXT_PUBLIC_API_URL
  Value: https://api.production.com
  ```

• **预览环境（Preview）**：  
  在同一界面选择 **Preview** 环境，添加 `.env.test` (preview 不会自动匹配.env.test，需要在项目中指定 `NEXT_PUBLIC_ENV`)中的变量：  
  ```plaintext
  Key: NEXT_PUBLIC_API_URL
  Value: https://api.test.com
  ```  
  *注意：Vercel 会优先使用控制台配置的变量，覆盖本地 `.env` 文件。*

#### **2. 关联 Git 分支与部署环境**
• **生产环境**：绑定 `main` 或 `master` 分支，代码合并后自动触发生产环境构建，并使用 **Production 变量**。  
• **预览环境**：其他分支（如 `test`、`staging`）触发部署时，自动使用 **Preview 变量**。  
  *注：此策略基于 Vercel 的分支自动识别机制。*

---

### **二、Next.js 环境文件适配**
#### **1. 本地开发与构建规则**
• 本地开发时，Next.js 默认加载 `.env.local` > `.env.development` > `.env`。  
• 生产构建时，自动加载 `.env.production`，但 **Vercel 注入的环境变量优先级更高**。  
  *建议：本地保留 `.env.development` 用于调试，但无需提交到仓库。*

#### **2. 代码中动态判断环境**
在服务端或客户端代码中，通过环境变量区分逻辑：  
```javascript
// 示例：根据环境切换接口
const apiUrl = process.env.NEXT_PUBLIC_API_URL;

if (process.env.NEXT_PUBLIC_ENV === 'test') {
  // 测试环境逻辑
}
```

---

### **三、高级配置方法**
#### **1. 通过 Vercel CLI 指定环境变量**
在本地或 CI/CD 流程中，可通过 CLI 直接注入变量：  
```bash
vercel deploy --prod --build-env NEXT_PUBLIC_API_URL=https://api.production.com
```  
*注：适用于临时覆盖变量，但不推荐长期使用。*

#### **2. 使用 `vercel.json` 配置**
在项目根目录创建 `vercel.json`，定义环境变量作用域：  
```json
{
  "build": {
    "env": {
      "NEXT_PUBLIC_ENV": {
        "production": "production",
        "preview": "test"
      }
    }
  }
}
```  
*注：需结合 Vercel 环境类型（production/preview）动态赋值。*

#### **3. 同步本地与远程变量**
通过 CLI 拉取 Vercel 环境变量到本地：  
```bash
vercel env pull .env.local  # 拉取生产环境变量
vercel env pull --environment preview .env.test  # 拉取预览环境变量
```  
*注：适用于本地调试时模拟远程环境。*

---

### **四、验证与调试**
1. **部署日志检查**：  
   在 Vercel 的「Deployments」中查看构建日志，确认环境变量已正确注入。  
2. **前端输出调试**：  
   临时在页面中打印变量：  
   ```javascript
   console.log('当前环境：', process.env.NEXT_PUBLIC_ENV);
   ```  
3. **API 接口验证**：  
   创建测试接口返回环境信息：  
   ```javascript
   // pages/api/env.js
   export default function handler(req, res) {
     res.status(200).json({ env: process.env.NEXT_PUBLIC_ENV });
   }
   ```

---

### **五、注意事项**
• **敏感变量保护**：服务端变量（如数据库密码）不要添加 `NEXT_PUBLIC_` 前缀，避免前端暴露。  
• **缓存清理**：修改变量后需重新部署，客户端可能需要强制刷新（`Ctrl+F5`）。  
• **分支策略**：在 GitLab/GitHub 中保护主分支，避免误操作触发生产环境变更。

---

通过以上配置，即可实现 Next.js 项目在 Vercel 上按环境动态加载对应的 `.env` 变量。如需进一步优化，可参考 [Vercel 官方文档](https://vercel.com/docs/projects/environment-variables)。