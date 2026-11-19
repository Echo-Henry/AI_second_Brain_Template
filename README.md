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

## 使用要点
- 所有文档均为纯 Markdown，配合 Obsidian 等工具可实现语义检索与问答（RAG）。
- 在 `clinerules/brain-rules.md` 中持续迭代你的写作偏好与归档规则，AI 越用越懂你。
- 本模板不含任何个人业务数据，可直接公开分享，无需担心隐私泄露。