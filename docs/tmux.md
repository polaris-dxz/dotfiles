# 🚀 Modern AI-Native tmux Workflow Guide

适用于：

* Claude Code
* lazygit
* yazi
* Neovim
* terminal-native workflow
* AI-assisted development

---

# 📦 什么是 tmux？

tmux 是：

```text
Terminal Workspace Manager
```

它可以：

* 分屏
* 保持会话
* 后台运行任务
* popup window
* 多项目切换
* SSH 断线恢复

你可以理解成：

```text
Terminal IDE
```

。

---

# 🧠 我的 tmux 工作流

当前 workflow：

```text
tmux
 ├── Claude popup
 ├── lazygit popup
 ├── yazi popup
 ├── nvim
 ├── logs
 └── shell
```

核心理念：

```text
Everything inside tmux
```

。

---

# ⚡ Prefix Key

默认 tmux 是：

```text
Ctrl-b
```

我们改成：

```text
Ctrl-a
```

因为：

* 更舒服
* 更接近 Vim
* 更快

---

# 📁 我的 tmux.conf

```tmux
# ---------------------------------------------------
# Prefix
# ---------------------------------------------------

unbind C-b
set -g prefix C-a
bind C-a send-prefix

# ---------------------------------------------------
# General
# ---------------------------------------------------

set -g mouse on
set -g history-limit 100000
set -g escape-time 0
set -g focus-events on
set -g renumber-windows on
set -g base-index 1
set -g set-clipboard on

# ---------------------------------------------------
# True Color
# ---------------------------------------------------

set -g default-terminal "screen-256color"

set -as terminal-features ",xterm-256color:RGB"
set -as terminal-features ",screen-256color:RGB"

# ---------------------------------------------------
# Better Splits
# ---------------------------------------------------

unbind '"'
unbind %

bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# ---------------------------------------------------
# Vim Navigation
# ---------------------------------------------------

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# ---------------------------------------------------
# Resize Panes
# ---------------------------------------------------

bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# ---------------------------------------------------
# Reload Config
# ---------------------------------------------------

bind r source-file ~/.tmux.conf \; display "tmux.conf reloaded"

# ---------------------------------------------------
# Claude Code popup
# ---------------------------------------------------

bind-key y run-shell '
CURRENT_DIR="#{pane_current_path}";
SESSION_NAME="claude-$(echo "$CURRENT_DIR" | md5 | cut -c1-8)";

tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s "$SESSION_NAME" -c "$CURRENT_DIR" "
    claude --dangerously-skip-permissions
  "
fi

tmux display-popup \
  -w 85% \
  -h 85% \
  -E "tmux attach-session -t $SESSION_NAME"
'

# ---------------------------------------------------
# Lazygit popup
# ---------------------------------------------------

bind-key g display-popup \
  -w 85% \
  -h 85% \
  -E "lazygit"

# ---------------------------------------------------
# Yazi popup
# ---------------------------------------------------

bind-key f display-popup \
  -w 90% \
  -h 90% \
  -E "yazi"

# ---------------------------------------------------
# btop popup
# ---------------------------------------------------

bind-key b display-popup \
  -w 80% \
  -h 80% \
  -E "btop"

# ---------------------------------------------------
# Session Navigation
# ---------------------------------------------------

bind-key s choose-tree -Z

# ---------------------------------------------------
# Copy Mode
# ---------------------------------------------------

setw -g mode-keys vi

bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

# ---------------------------------------------------
# Plugins
# ---------------------------------------------------

set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'catppuccin/tmux'

set -g @plugin 'tmux-plugins/tmux-resurrect'

set -g @plugin 'tmux-plugins/tmux-continuum'

set -g @plugin 'tmux-plugins/tmux-yank'

set -g @plugin 'christoomey/vim-tmux-navigator'

set -g @continuum-restore 'on'

# ---------------------------------------------------
# TPM
# ---------------------------------------------------

run '~/.tmux/plugins/tpm/tpm'
```

---

# 🧩 插件说明

---

## TPM

[TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm?utm_source=chatgpt.com)

tmux 插件管理器。

安装：

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

安装插件：

```text
Prefix + I
```

---

## Catppuccin

[catppuccin/tmux](https://github.com/catppuccin/tmux?utm_source=chatgpt.com)

tmux 主题。

---

## tmux-resurrect

[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect?utm_source=chatgpt.com)

保存 tmux session。

---

## tmux-continuum

[tmux-continuum](https://github.com/tmux-plugins/tmux-continuum?utm_source=chatgpt.com)

自动恢复 session。

---

## tmux-yank

[tmux-yank](https://github.com/tmux-plugins/tmux-yank?utm_source=chatgpt.com)

tmux copy 同步系统剪贴板。

---

## vim-tmux-navigator

[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator?utm_source=chatgpt.com)

nvim 和 tmux 无缝切 pane。

---

# ⌨️ 常用快捷键

---

# Session

| 快捷键        | 功能           |
| ---------- | ------------ |
| Prefix + s | Session tree |
| Prefix + d | detach       |

---

# Window

| 快捷键        | 功能              |
| ---------- | --------------- |
| Prefix + c | new window      |
| Prefix + n | next window     |
| Prefix + p | previous window |

---

# Pane

| 快捷键              | 功能               |
| ---------------- | ---------------- |
| Prefix + |       | vertical split   |
| Prefix + -       | horizontal split |
| Prefix + h/j/k/l | move pane        |
| Prefix + H/J/K/L | resize pane      |

---

# Popup Workflow

| 快捷键        | 功能           |
| ---------- | ------------ |
| Prefix + y | Claude popup |
| Prefix + g | lazygit      |
| Prefix + f | yazi         |
| Prefix + b | btop         |

---

# Reload

| 快捷键        | 功能               |
| ---------- | ---------------- |
| Prefix + r | reload tmux.conf |

---

# 📋 Copy Mode

进入：

```text
Prefix + [
```

操作：

| 键位 | 功能   |
| -- | ---- |
| v  | 开始选择 |
| y  | 复制   |
| q  | 退出   |

---

# 🤖 Claude Popup Workflow

这是当前最核心的 workflow。

---

## 打开

```text
Prefix + y
```

---

## 特点

* popup window
* 独立 session
* session persistent
* 每个项目独立 Claude context

---

## 为什么这样做？

因为：

```text
AI context = workspace context
```

。

每个项目：

* 独立 Claude session
* 独立上下文
* 不互相污染

这是 AI-native terminal workflow 的核心。

---

# 🗂 Lazygit Workflow

打开：

```text
Prefix + g
```

退出：

```text
q
```

作用：

* commit
* branch
* stash
* rebase
* cherry-pick

---

# 📁 Yazi Workflow

打开：

```text
Prefix + f
```

作用：

* 文件浏览
* 图片预览
* 快速跳目录

---

# 🧠 我的推荐工作流

---

## 开项目

```text
tmux
```

---

## 打开代码

```text
nvim
```

---

## 打开 AI

```text
Prefix + y
```

---

## Git 操作

```text
Prefix + g
```

---

## 文件管理

```text
Prefix + f
```

---

# 🔥 Philosophy

这个 workflow 的核心：

```text
减少上下文切换
```

。

不需要：

* Alt-tab
* 鼠标切窗口
* 打开 IDE sidebar

所有东西：

```text
inside tmux
```

。

---

# 🚀 下一阶段

后面可以继续扩展：

* Neovim IDE
* tmux session templates
* Kubernetes popup
* AI multi-agent workflow
* remote development
* cloud-native terminal workflow

tmux 最终会越来越像：

```text
Personal Operating System
```

。:::

