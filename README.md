# AI 个人第二大脑 · 通用知识库模板

一套基于 **Markdown + VS Code + Cline + Git** 的轻量级 Agentic RAG 个人第二大脑模板。零数据库开销，数据 100% 本地/私有掌控，可公开分享、可随时 fork 复用。

> 模板目录与 `01-Tech-Specs` / `02-Troubleshooting` 等历史目录完全解耦，不包含任何个人业务笔记、域名、内网 IP 或密钥，可直接用于公开仓库。

---

## 目录结构说明

| 目录 | 作用 |
| --- | --- |
| `00-Inbox/` | 临时草稿、待整理方案，存放新写的文档等待自动归类 |
| `01-Tech-Specs/` | 正式技术方案、架构设计、接口文档等知识沉淀 |
| `02-Troubleshooting/` | 报错记录、踩坑复盘、排错指南 |
| `03-Templates-Prompts/` | 可复用命令速查表、提示词模板、标准化清单 |
| `clinerules/brain-rules.md` | 给 AI 的记忆与训练规则（写作规范、归档标准、自动化 SOP） |

每个分类目录下均附带 `.gitkeep`，保证空目录可被 Git 追踪。

---

## 3 分钟快速上手

### 1. 创建自己的私有仓库
- **方式 A（推荐）**：直接在 GitHub 上点击仓库右上角 **`Use this template`**，创建一个新的私有仓库，选择本模板作为来源。
- **方式 B**：克隆本模板仓库后执行 `git clone`，再 `git remote add origin <你的 GitHub 仓库地址>` 关联自己的仓库。

### 2. 安装 Cline 插件并配置大模型 API Key
1. 打开 VS Code → 点击左侧活动栏的 **扩展图标（`Ctrl+Shift+X`）** 搜索 **`Cline`** 并安装。
2. 启动 Cline 会话，在模型配置中填入你自己的大模型 API Key（如 OpenAI、硅基流动、OpenRouter 等平台），并选择对应模型。

### 3. 一句话体验全自动归档与 Git 双备份
打开 Cline，直接对 Cline 说：

> **"这是我的学习笔记，你学习一下"**

AI 将自动识别笔记主题，按 SOP 自动归类到 `01-Tech-Specs` / `02-Troubleshooting` / `03-Templates-Prompts`，补充 YAML 标签，清理 `00-Inbox` 收件箱，并自动执行 `git add && git commit` 推送——全程零手动操作，Git 双备份即完成。

---

## 进阶扩展：接入 Obsidian 实现本地语义检索与问答（向量 RAG）

当你的知识库笔记积累到数百篇以上时，可以让 **Cline（负责自动整理与写入）** 与 **Obsidian（负责可视化阅读与全库语义问答）** 协同工作：

1. **用 Obsidian 打开知识库目录**：
   - 下载并打开 Obsidian，选择 **"打开本地文件夹作为仓库（Open folder as vault）"**，直接选中你克隆下来的 `AI_second_Brain_Template` 根目录（两者共用同一份 Markdown 文件，零迁移成本）。
   - *建议设置*：在 Obsidian 设置 → `文件与链接` 中，关闭或忽略对 `clinerules` 目录的干扰，保持笔记视图清爽。

2. **安装社区语义检索（RAG）插件（任选其一）**：
   - 进入 Obsidian 设置 → `第三方插件`（关闭安全模式）→ 点击 `浏览` 搜索安装：
     - **Smart Connections（推荐，开箱即用）**：自动对全库 Markdown 进行语义切片与本地/云端向量化（Embedding），侧边栏实时推荐"语义最相似的历史笔记"，并支持直接针对全库内容进行 RAG 问答。
     - **Copilot for Obsidian**：支持绑定 OpenAI、DeepSeek、SiliconFlow 或本地 Ollama 模型，输入 `@vault` 即可基于整个知识库进行带引用来源的语义检索问答。

3. **配置向量化（Embedding）与对话模型**：
   - 在插件设置中填入你的大模型 API Key（或配置本地 Ollama 模型的 `nomic-embed-text` 等轻量向量模型），点击触发全库建立向量索引。
   - 索引完成后，后续每次 Cline 自动归档新笔记并 `git push` 后，Obsidian 都会在后台自动增量更新向量坐标。

4. **注意 `.gitignore` 防止插件缓存污染仓库**：
   - 建议将 Obsidian 自动生成的 `.obsidian/` 配置与向量缓存目录加入 `.gitignore`（或仅保留核心快捷键配置），避免每次打开 Obsidian 都产生大量无意义的 Git 变更记录。

---

## 使用要点
- 所有文档均为纯 Markdown，配合 Obsidian 等工具可实现语义检索与问答（RAG）。
- 在 `clinerules/brain-rules.md` 中持续迭代你的写作偏好与归档规则，AI 越用越懂你。
- 本模板不含任何个人业务数据，可直接公开分享，无需担心隐私泄露。