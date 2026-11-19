# AI 个人第二大脑 · 通用知识库模板

一套基于 **Markdown + VS Code + Cline + Git** 的轻量级 Agentic RAG 个人第二大脑模板。零数据库开销，数据 100% 本地/私有掌控，可公开分享、可随时 fork 复用。所有文档均为纯 Markdown，配合 Obsidian 等工具可实现语义检索与问答（RAG）；不含任何个人业务数据，可直接公开分享。

![GitHub stars](https://img.shields.io/github/stars/Echo-Henry/AI_second_Brain_Template?style=flat-square&color=blue)
![Template](https://img.shields.io/badge/GitHub-Template_Repository-2ea44f?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey?style=flat-square)
![Stack](https://img.shields.io/badge/Stack-Markdown%20%2B%20Cline%20%2B%20Git%20%2B%20Obsidian-orange?style=flat-square)

> **告别重型向量数据库与复杂的本地环境配置！** 只需纯 Markdown 文件 + VS Code Cline 智能体 + Git，说一句"这是我的学习笔记，你学习一下"，即可实现全自动分类归档、异地双备份与本地语义检索（Agentic RAG）。

> 模板目录与 `01-Tech-Specs` / `02-Troubleshooting` 等历史目录完全解耦，不包含任何个人业务笔记、域名、内网 IP 或密钥，可直接用于公开仓库。

---

## 工作原理一览（Mermaid 架构图）

```mermaid
graph LR
    User["用户输入碎片笔记 / 00-Inbox"] --> Cline["Cline 读取 brain-rules.md"]
    Cline --> Auto["自动识别领域并结构化清洗"]
    Auto --> Archive["归档至 01~03 对应目录"]
    Archive --> Push["自动 Git Push 异地双备份"]
    Push --> Mobile["手机端 Obsidian App 随时随地查阅"]
    Push --> Index["Obsidian 向量索引 / 语义问答"]
```

## 目录结构说明

| 目录 | 作用 |
| --- | --- |
| `00-Inbox/` | 临时草稿、待整理方案，存放新写的文档等待自动归类 |
| `01-Tech-Specs/` | 正式技术方案、架构设计、接口文档等知识沉淀 |
| `02-Troubleshooting/` | 报错记录、踩坑复盘、排错指南 |
| `03-Templates-Prompts/` | 可复用命令速查表、提示词模板、标准化清单 |
| `clinerules/brain-rules.md` | 给 AI 的记忆与训练规则（写作规范、归档标准、自动化 SOP） |
| `clinerules/tutor-mode.md` | 导师模式（苏格拉底式引导 + 费曼验收） |

每个分类目录下均附带 `.gitkeep`，保证空目录可被 Git 追踪。

---

## 第一步：安装与部署（二选一）

### 方案 A：一键全自动安装（推荐新手 / 小白）

**Windows 用户**：点击页面右上角 `Code → Download ZIP` 下载压缩包并解压，直接双击运行 `setup.bat`，脚本会自动检测安装 Git、VS Code、Cline 插件并初始化仓库。

**Mac / Linux 用户**：在解压目录终端执行 `chmod +x setup.sh && bash setup.sh` 即可全自动完成配置。

> **提示**：脚本运行结束后会自动弹出 VS Code，你只需在右侧 Cline 面板填入自己的大模型 API Key 即可直接进入"第二步：开始使用"。

### 方案 B：GitHub 模板手动部署（推荐开发者）

- 点击右上角 `Use this template` 创建私有仓库并 `git clone` 到本地；
- 用 VS Code 打开目录，在扩展商店（`Ctrl+Shift+X`）搜索安装 **Cline** 插件并填入 API Key。

---

## 第二步：日常使用指南（零门槛体验）

### 1. 一句话投喂与自动归档

打开 Cline 对话框，直接粘贴笔记并发送 **"这是我的学习笔记，你学习一下"**（或将草稿放入 `00-Inbox/`），AI 会自动识别领域、创建子目录、补充标签、清理收件箱并自动 `git push` 双备份。

### 2. 持续进化你的 AI 规则

按需修改 `clinerules/brain-rules.md` 中的分类偏好与排版规范，AI 会越来越懂你的工作流。

### 3. 开启"导师模式"互动学习与费曼验收

当你想系统学习某个知识点（如 Linux 的 rwx 权限机制、Git 提交规范、Python 异步编程等），直接发送口令 **"开启导师模式，带我一步步搞懂 Linux 的 rwx 权限机制"**，AI 会切换为苏格拉底式导师，通过提问引导、分步拆解、实战出题验收完成教学，学完后再询问是否一键归档。

支持的触发口令示例：
- `开启导师模式，带我一步步搞懂 Linux 的 rwx 权限机制`
- `用导师模式考考我：什么是 Git 的 rebase 和 merge 区别？`
- `开启导师模式，帮我理解 Python 的 asyncio 异步编程`

---

## 第三步：进阶扩展

### 1. PC + 手机 App + GitHub 三端自动同步（免费闭环）

**核心架构**：电脑端（VS Code + Cline）负责 AI 自动写入与整理 → GitHub 私有仓库作为云端中转枢纽 → 手机端 Obsidian App 随时随地查阅与记录。

**电脑端配置（Obsidian Git 插件）**：

- 在电脑端 Obsidian 的 `设置 → 第三方插件` 中搜索安装 **`Obsidian Git`** 插件（或继续依赖 Cline 每次归档后的自动 `git push`）。
- 建议开启 `Auto pull on startup`（启动时自动拉取手机端的新增笔记）与定时自动推送。

**手机端配置（iOS / Android 免费同步方案）**：

- **通用插件方案（推荐）**：在手机端 Obsidian App 中同样安装 **`Obsidian Git`** 插件，填入 GitHub 仓库地址与 Personal Access Token（PAT 个人访问令牌），即可一键双向拉取/推送。
- **iOS 轻量替代方案**：也可配合 **Working Copy**（Git 客户端）将 GitHub 仓库克隆到手机本地文件夹，再让 Obsidian 直接打开该文件夹。
- **Android 轻量替代方案**：也可通过 **Termux** 执行 `git clone` 克隆仓库至手机存储，并用 Obsidian 打开对应目录。

**防冲突最佳实践**：确保 `.gitignore` 已忽略 `.obsidian/` 目录，避免手机端和电脑端的界面状态缓存产生 Git 合并冲突。

### 2. 本地语义检索与全库问答（向量 RAG）

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