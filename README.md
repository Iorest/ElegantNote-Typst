# ElegantNote-Typst

**优美的 Typst 笔记模板 | An Elegant Typst Template for Notes**

> 排版风格借鉴自 [ElegantNote](https://github.com/ElegantLaTeX/ElegantNote)（LaTeX 原版）

-------

## 快速开始 Quick Start

### 在线使用 Online Usage

将 `elegantnote.typ` 和你的文档文件上传到 [Typst Web App](https://typst.app/) 即可在线使用。

### 本地使用 Local Usage

1. 安装 [Typst](https://github.com/typst/typst)（v0.12+）
2. 克隆本仓库或下载 Release
3. 编译文档：

```bash
typst compile elegantnote-cn.typ   # 中文版
typst compile elegantnote-en.typ   # 英文版
```

实时预览：

```bash
typst watch elegantnote-cn.typ
```

### 在你的项目中使用

将 `elegantnote.typ` 复制到你的工作目录，然后在文档顶部导入：

```typst
#import "elegantnote.typ": *

#show: elegantnote.with(
  title:     [你的笔记标题],
  author:    "作者",
  institute: "某某大学",
  date:      "2026 年",
  version:   "1.0",
  color:     "blue",    // blue | green | cyan | sakura | black | brown
  mode:      "hazy",    // none | geye | hazy | sepia
  device:    "normal",  // pad | pc | kindle | normal | screen
  lang:      "cn",
)
```

## 功能特性 Features

- 🎨 **6 套颜色主题**：`blue`（默认）、`green`、`cyan`、`sakura`、`black`、`brown`
- 🌿 **3 种背景模式**：护眼（`geye`）、朦胧（`hazy`）、复古（`sepia`）
- 📱 **5 种设备适配**：`pad`（默认）、`pc`、`kindle`、`normal`（A4）、`screen`（4:3）
- 🌐 **中英文双语支持**：通过 `lang` 参数切换
- 📐 **定理类环境**：定理、引理、命题、推论、定义、猜想、例题（彩色标签）
- 🔍 **证明/注记/评论/案例环境**：带结束符号
- 🔗 **实用命令**：`#email`

## 项目结构 Project Structure

```
ElegantNote-Typst/
├── elegantnote.typ        ← 核心模板文件
├── elegantnote-cn.typ     ← 中文演示文档
├── elegantnote-en.typ     ← 英文演示文档
└── image/                 ← 文档中使用的插图
```

## 致谢 Acknowledgement

本模板的排版风格借鉴自 [ElegantNote](https://github.com/ElegantLaTeX/ElegantNote)（原 LaTeX 版本），感谢原项目及其贡献者的优秀设计。

The typographic style of this template is inspired by [ElegantNote](https://github.com/ElegantLaTeX/ElegantNote) (the original LaTeX version). Thanks to the original project and its contributors for the excellent design.

## 协议 License

本模板发布遵循 LaTeX 项目公共许可证 1.3c 或更高版本。

This work is released under the LaTeX Project Public License, v1.3c or later.
