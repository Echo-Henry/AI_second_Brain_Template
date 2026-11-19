@echo off
chcp 65001 >nul 2>nul
title AI Second Brain 一键部署

REM ===== 检查 winget =====
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo [错误] 未检测到 winget，请先安装 Windows Package Manager。
    echo   下载地址: https://github.com/microsoft/winget-cli/releases
    pause
    exit /b 1
)

REM ===== 检查并安装 Git =====
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [安装] 未检测到 Git，正在通过 winget 自动安装...
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
    if %errorlevel% neq 0 (
        echo [错误] Git 安装失败，请手动安装后重试。
        pause
        exit /b 1
    )
    echo [完成] Git 已安装，请重新打开命令行窗口生效。
) else (
    echo [检测] Git 已安装。
)

REM ===== 检查并安装 VS Code =====
where code >nul 2>nul
if %errorlevel% neq 0 (
    echo [安装] 未检测到 VS Code，正在通过 winget 自动安装...
    winget install --id Microsoft.VisualStudioCode -e --source winget --accept-source-agreements --accept-package-agreements
    if %errorlevel% neq 0 (
        echo [错误] VS Code 安装失败，请手动安装后重试。
        pause
        exit /b 1
    )
    echo [完成] VS Code 已安装，请重新打开命令行窗口生效。
) else (
    echo [检测] VS Code 已安装。
)

REM ===== 初始化 Git 仓库 =====
set "DEPLOY_DIR=%~dp0"
if not exist "%DEPLOY_DIR%" (
    echo [错误] 无法定位部署目录: %DEPLOY_DIR%
    pause
    exit /b 1
)
cd /d "%DEPLOY_DIR%"

REM 清除已有 .git 历史
if exist .git (
    echo [清理] 检测到已有 .git 目录，正在删除...
    rmdir /s /q .git
)

git init
if %errorlevel% neq 0 (
    echo [错误] git init 失败，请检查 Git 是否正确安装。
    pause
    exit /b 1
)
echo [完成] Git 仓库已初始化。

REM ===== 配置 GitHub remote =====
set /p GITHUB_REPO="请输入您的 GitHub 私有仓库地址（含 .git，例如 https://github.com/user/repo.git）："
if "%GITHUB_REPO%"=="" (
    echo [跳过] 未提供仓库地址，跳过 remote 配置。
) else (
    git remote add origin "%GITHUB_REPO%" 2>nul
    if %errorlevel% neq 0 (
        echo [提示] remote 已存在，跳过。
    ) else (
        echo [完成] remote 已绑定: %GITHUB_REPO%
    )
)

REM ===== 安装 Cline 插件 =====
code --install-extension saoudrizwan.claude-dev
if %errorlevel% neq 0 (
    echo [警告] Cline 插件安装失败，请手动打开 VS Code → 扩展搜索 "Cline" 安装。
) else (
    echo [完成] Cline 插件已安装。
)

REM ===== 打开 VS Code =====
code .
echo.
echo ========================================
echo   部署完成！请在右侧 Cline 面板填入
echo   您的 API Key 即可开始使用。
echo ========================================
pause