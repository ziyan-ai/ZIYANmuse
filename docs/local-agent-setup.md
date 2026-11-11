# Windows 本地 Agent 一键部署

## 前置条件

- Windows 10 或 11
- Python 3.10–3.14，并且 python 在 PATH 中
- FFmpeg 已安装，ffmpeg 和 ffprobe 都能在 PowerShell 中运行
- 已安装 Git

## 一键安装

在 PowerShell 中粘贴以下两行。脚本会建立隔离的 Python 环境、安装完整 OCR 依赖、安装 CLI、把 skill 放到 Codex；如果本机已装 Claude Code 或通用 Agent skill 目录，也会一并安装。

```powershell
git clone --branch rea-ziyanai https://github.com/ziyan-ai/ZIYANmuse.git "$env:USERPROFILE\rea-ziyanai"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\rea-ziyanai\scripts\install_skill.ps1"
```

安装后可用以下命令查看 CLI：

```powershell
& "$env:USERPROFILE\rea-ziyanai\.venv\Scripts\rea-ziyanai.exe" --help
```

重启 Codex 后，skill 会自动加载。然后把视频路径发给 Agent，例如：

```text
请用 rea-ziyanai skill 分析 D:\Videos\input.mp4。按视频本身判断实拍、AI、3D、代码或混合制作；检查不确定的镜头；在 D:\Videos\rea-report 输出中文报告。
```

## 让本地 Agent 替你部署

也可以把这段指令发给本机 Codex：

```text
请在这台 Windows 电脑上部署 rea-ziyanai：从 https://github.com/ziyan-ai/ZIYANmuse 的 rea-ziyanai 分支克隆到 %USERPROFILE%\rea-ziyanai，用 PowerShell 执行 scripts\install_skill.ps1，确认 rea-ziyanai --help 能运行，并告诉我缺少的前置依赖。安装完成后等待我给你视频路径。
```

如果安装脚本报告缺少 FFmpeg，请先把 FFmpeg 安装目录加入 PATH，再重跑脚本。详细依赖和 VLM 配置见 skill 安装说明：../skills/rea-ziyanai/references/setup.md。

## 手动运行

```powershell
& "$env:USERPROFILE\rea-ziyanai\.venv\Scripts\rea-ziyanai.exe" decompose "D:\Videos\input.mp4" -o "D:\Videos\rea-report"
```

不配置视频模型也能运行本地分析；需要视觉模型辅助判断时，按 skill 安装说明配置兼容 OpenAI API 的服务。
