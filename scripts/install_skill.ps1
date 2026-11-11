$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path -Parent $PSScriptRoot
$PythonCmd = Get-Command python -ErrorAction SilentlyContinue
if (-not $PythonCmd) {
    throw '未找到 Python。请先安装 Python 3.10–3.14，并将 python 加入 PATH。'
}

$PythonVersion = & $PythonCmd.Source -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
$VersionParts = $PythonVersion.Split('.')
$PythonMajor = [int]$VersionParts[0]
$PythonMinor = [int]$VersionParts[1]
if ($PythonMajor -ne 3 -or $PythonMinor -lt 10 -or $PythonMinor -gt 14) {
    throw "当前 Python 为 $PythonVersion。请使用 Python 3.10–3.14。"
}

if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue) -or -not (Get-Command ffprobe -ErrorAction SilentlyContinue)) {
    throw '缺少 ffmpeg 或 ffprobe。请先安装 FFmpeg，并确认两个命令都在 PATH 中。'
}

$VenvPython = Join-Path $RepoRoot '.venv/Scripts/python.exe'
if (-not (Test-Path -LiteralPath $VenvPython)) {
    & $PythonCmd.Source -m venv (Join-Path $RepoRoot '.venv')
    if ($LASTEXITCODE -ne 0) { throw '创建 Python 虚拟环境失败。' }
}

Push-Location $RepoRoot
try {
    & $VenvPython -m pip install -e '.[ocr]'
    if ($LASTEXITCODE -ne 0) { throw '安装 rea-ziyanai 依赖失败。' }
    & $VenvPython -m pip show opencv-python *> $null
    if ($LASTEXITCODE -eq 0) {
        & $VenvPython -m pip uninstall -y opencv-python
        if ($LASTEXITCODE -ne 0) { throw '清理重复的 OpenCV 包失败。' }
        & $VenvPython -m pip install --force-reinstall --no-deps 'opencv-python-headless>=4.8,<5'
        if ($LASTEXITCODE -ne 0) { throw '安装 OpenCV headless 版本失败。' }
    }
} finally {
    Pop-Location
}

$SkillSource = Join-Path $RepoRoot 'skills/rea-ziyanai'
$SkillTargets = @((Join-Path $HOME '.codex/skills/rea-ziyanai'))
foreach ($AgentDir in @('.agents', '.claude')) {
    $AgentRoot = Join-Path $HOME $AgentDir
    if (Test-Path -LiteralPath $AgentRoot) {
        $SkillTargets += Join-Path $AgentRoot 'skills/rea-ziyanai'
    }
}
foreach ($Target in $SkillTargets) {
    New-Item -ItemType Directory -Path $Target -Force | Out-Null
    Copy-Item -Path (Join-Path $SkillSource '*') -Destination $Target -Recurse -Force
}

$Cli = Join-Path $RepoRoot '.venv/Scripts/rea-ziyanai.exe'
& $Cli --help | Out-Null
if ($LASTEXITCODE -ne 0) { throw '命令行检查失败。' }

Write-Host '安装完成。rea-ziyanai 命令可用，Codex Skill 已复制到 ~/.codex/skills/rea-ziyanai。'
Write-Host "命令行入口：$Cli"
