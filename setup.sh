#!/usr/bin/env bash
set -e

echo "========================================"
echo "  AI Second Brain 一键部署"
echo "========================================"

# ===== 检测平台与包管理器 =====
case "$(uname -s)" in
    Darwin)
        PKG_MANAGER="brew"
        ;;
    Linux)
        if command -v apt-get &> /dev/null; then
            PKG_MANAGER="apt"
        elif command -v dnf &> /dev/null; then
            PKG_MANAGER="dnf"
        elif command -v yum &> /dev/null; then
            PKG_MANAGER="yum"
        else
            echo "[错误] 无法自动检测包管理器，请手动安装 Git 和 VS Code。"
            exit 1
        fi
        ;;
    *)
        echo "[错误] 不支持的操作系统: $(uname -s)"
        exit 1
        ;;
esac

# ===== 安装 Git =====
if command -v git &> /dev/null; then
    echo "[检测] Git 已安装。"
else
    echo "[安装] 未检测到 Git，正在通过 $PKG_MANAGER 安装..."
    case "$PKG_MANAGER" in
        brew)  brew install git ;;
        apt)   sudo apt update && sudo apt install -y git ;;
        dnf)   sudo dnf install -y git ;;
        yum)   sudo yum install -y git ;;
    esac
fi

# ===== 安装 VS Code =====
if command -v code &> /dev/null; then
    echo "[检测] VS Code 已安装。"
else
    echo "[安装] 未检测到 VS Code，正在通过 $PKG_MANAGER 安装..."
    case "$PKG_MANAGER" in
        brew)      brew install --cask visual-studio-code ;;
        apt)       wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - && sudo apt update && sudo apt install -y code ;;
        dnf)       sudo dnf install -y codium ;;
        yum)       sudo yum install -y codium ;;
    esac
fi

# ===== 初始化 Git 仓库 =====
DEPLOY_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$DEPLOY_DIR"

# 清除已有 .git 历史
if [ -d .git ]; then
    echo "[清理] 检测到已有 .git 目录，正在删除..."
    rm -rf .git
fi

git init
echo "[完成] Git 仓库已初始化。"

# ===== 配置 GitHub remote =====
read -rp "请输入您的 GitHub 私有仓库地址（含 .git，例如 https://github.com/user/repo.git）： " GITHUB_REPO
if [ -z "$GITHUB_REPO" ]; then
    echo "[跳过] 未提供仓库地址，跳过 remote 配置。"
else
    if git remote add origin "$GITHUB_REPO" 2>/dev/null; then
        echo "[完成] remote 已绑定: $GITHUB_REPO"
    else
        echo "[提示] remote 已存在，跳过。"
    fi
fi

# ===== 安装 Cline 插件 =====
if ! code --install-extension saoudrizwan.claude-dev; then
    echo "[警告] Cline 插件安装失败，请手动打开 VS Code → 扩展搜索 'Cline' 安装。"
fi

# ===== 打开 VS Code =====
code .

echo ""
echo "========================================"
echo "  部署完成！请在右侧 Cline 面板填入"
echo "  您的 API Key 即可开始使用。"
echo "========================================"