// =============================================================================
// ElegantNote-Typst — 中文演示
// elegantnote-cn.typ
// =============================================================================

#import "elegantnote.typ": *

#show: elegantnote.with(
  title:     [ElegantNote：一个优美的 Typst 笔记模板],
  author:    "作者",
  institute: "ElegantLaTeX Program",
  date:      "2026 年 6 月",
  version:   "1.0",
  logo:      "image/logo-blue.png",
  color:     "blue",   // blue | green | cyan | sakura | black | brown
  mode:      "sepia",  // none | geye | hazy | sepia
  device:    "normal", // pad | pc | kindle | normal | screen
  lang:      "cn",
)

= ElegantNote 使用说明

本模板自 2026 年起基于 Typst 重新构建，排版风格借鉴自 #link("https://github.com/ElegantLaTeX/ElegantNote")[ElegantNote]（LaTeX 原版）。

新模板有下面几个特性：

- 背景模式：护眼模式（`geye`）、朦胧模式（`hazy`）和复古模式（`sepia`）；
- 适配不同设备，包括 Pad（默认）、Screen（幻灯片）、Kindle、PC、通用（A4 纸张）；
- 6 套颜色主题：`blue`（默认）、`green`、`cyan`、`sakura`、`black`、`brown`；
- 语言支持：中文（默认）、英文；
- 更加美观的图表标题格式、列表环境、数学字体等；
- 使用 Typst 原生数学排版，无需额外配置；
- 中文字体支持系统字体或者自定义字体。

== 背景模式

本模板提供三种背景模式：护眼模式（`mode: "geye"`）、朦胧模式（`mode: "hazy"`）和复古模式（`mode: "sepia"`）。其中护眼模式设置纸张底色为绿豆沙颜色，朦胧模式为淡米白色，复古模式为棕黄色：

```typst
#show: elegantnote.with(mode: "geye")   // 护眼绿
#show: elegantnote.with(mode: "hazy")   // 朦胧米白
#show: elegantnote.with(mode: "sepia")  // 复古棕黄
```

#note(color: "blue", lang: "cn")[
  如果你想为自己的文档添加自定义底色，可以在 `elegantnote.with(...)` 之后用 `set page(fill: ...)` 覆盖。
]

== 设备选择

为了让笔记方便在不同设备上阅读，免去切边、缩放等操作，本模板适配不同的设备：

```typst
#show: elegantnote.with(device: "pad")     // iPad 屏幕大小（默认）
#show: elegantnote.with(device: "kindle")  // Kindle 屏幕大小
#show: elegantnote.with(device: "pc")      // PC 双页
#show: elegantnote.with(device: "normal")  // A4 标准页面
#show: elegantnote.with(device: "screen")  // 4:3 幻灯片大小
```

#note(color: "blue", lang: "cn")[
  如果想要正常的 A4 大小的 PDF，需要选择 `device: "normal"`。
]

== 颜色主题

本模板内置 6 套颜色主题：`blue`（默认）、`green`、`cyan`、`sakura`、`black`、`brown`。颜色主题会影响标题、定理环境标签、列表项、链接等所有彩色元素：

```typst
#show: elegantnote.with(color: "green")
#show: elegantnote.with(color: "cyan")
#show: elegantnote.with(color: "sakura")
#show: elegantnote.with(color: "black")
#show: elegantnote.with(color: "brown")
```

== 语言模式

本模板内含两套语言环境，改变语言环境会改变图表标题的引导词（图、表）、定理环境中的引导词（定理、引理等）：

```typst
#show: elegantnote.with(lang: "cn")  // 中文（默认）
#show: elegantnote.with(lang: "en")  // 英文
```

#note(color: "blue", lang: "cn")[
  只有中文模式才可输入中文。如果需要在英文模式下输入中文，可以在文档中手动设置字体。
]

== 定理类环境

此模板提供 4 类定理样式，所包含的环境分别为：

- *定理类*：`theorem`、`lemma`、`proposition`、`corollary`；
- *定义类*：`definition`、`conjecture`、`example`；
- *备注类*：`remark`、`note`、`case`；
- *证明类*：`proof`。

#remark(color: "blue", lang: "cn")[
  在选用 `lang: "cn"` 时，定理类环境的引导词全部会改为中文。
]

= 写作示例

我们将通过三个步骤定义可测函数的积分。首先定义非负简单函数的积分。以下设 $E$ 是 $cal(R)^n$ 中的可测集。

#definition(name: "可积性", color: "blue", lang: "cn")[
  设 $f(x) = sum_(i=1)^k a_i chi_(A_i)(x)$ 是 $E$ 上的非负简单函数，其中 ${A_1, A_2, dots, A_k}$ 是 $E$ 上的一个可测分割，$a_1, a_2, dots, a_k$ 是非负实数。定义 $f$ 在 $E$ 上的积分为
  $
    integral_E f dif x = sum_(i=1)^k a_i m(A_i).
  $
  一般情况下 $0 <= integral_E f dif x <= infinity$。若 $integral_E f dif x < infinity$，则称 $f$ 在 $E$ 上可积。
]

一个自然的问题是，Lebesgue 积分与我们所熟悉的 Riemann 积分有什么联系和区别？设 $D(x)$ 是区间 $[0,1]$ 上的 Dirichlet 函数，即 $D(x) = chi_(Q_0)(x)$，其中 $Q_0$ 表示 $[0,1]$ 中的有理数的全体。根据非负简单函数积分的定义：

$
  integral_0^1 D(x) dif x = integral_0^1 chi_(Q_0)(x) dif x = m(Q_0) = 0
$

即 $D(x)$ 在 $[0,1]$ 上是 Lebesgue 可积的并且积分值为零。但 $D(x)$ 在 $[0,1]$ 上不是 Riemann 可积的。

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    table.header([], [(1)], [(2)]),
    [燃油效率],   [-238.90\*\*\*], [-49.51],
    [],           [(53.08)],       [(86.16)],
    [汽车重量],   [],              [1.75\*\*\*],
    [],           [],              [(0.641)],
    [常数项],     [11,253\*\*\*],  [1,946],
    [],           [(1,171)],       [(3,597)],
    [观测数],     [74],            [74],
    [$R^2$],      [0.220],         [0.293],
    table.cell(colspan: 3, align: left)[#text(size: 8pt)[括号内为标准误]],
    table.cell(colspan: 3, align: left)[#text(size: 8pt)[\*\*\* $p < 0.01$，\*\* $p < 0.05$，\* $p < 0.1$]],
  ),
  caption: [燃油效率与汽车价格],
) <tab-reg>

#theorem(name: "Fubini 定理", color: "blue", lang: "cn")[
  若 $f(x,y)$ 是 $cal(R)^p times cal(R)^q$ 上的非负可测函数，则对几乎处处的 $x in cal(R)^p$，$f(x,y)$ 作为 $y$ 的函数是 $cal(R)^q$ 上的非负可测函数，$g(x) = integral_(cal(R)^q) f(x,y) dif y$ 是 $cal(R)^p$ 上的非负可测函数。并且
  $
    integral_(cal(R)^p times cal(R)^q) f(x,y) dif x dif y
    = integral_(cal(R)^p) lr((integral_(cal(R)^q) f(x,y) dif y)) dif x.
  $
]

#proof(color: "blue", lang: "cn")[
  设 $z$ 是 $x H inter y H$ 中的某个元素。则 $z = x a$（$a in H$），$z = y b$（$b in H$）。若 $h$ 是 $H$ 的任意元素，则 $a h in H$ 且 $a^(-1) h in H$，因为 $H$ 是 $G$ 的子群。但 $z h = x(a h)$ 且 $x h = z(a^(-1) h)$ 对所有 $h in H$ 成立。因此 $z H subset x H$ 且 $x H subset z H$，从而 $x H = z H$。类似地 $y H = z H$，故 $x H = y H$，证毕。
]

回归分析（regression analysis）是确定两种或两种以上变量间相互依赖的定量关系的一种统计分析方法。其运用十分广泛，回归分析按照涉及的变量的多少，分为一元回归和多元回归分析；按照因变量的多少，可分为简单回归分析和多重回归分析；按照自变量和因变量之间的关系类型，可分为线性回归分析和非线性回归分析。

= 致谢

特别感谢 #link("https://github.com/ElegantLaTeX/ElegantNote")[ElegantNote]（LaTeX 原版）项目组的优秀设计，本模板的排版风格借鉴自该项目。

如果你喜欢本模板，欢迎在 #link("https://github.com/Iorest/ElegantNote-Typst")[GitHub] 上给我们 Star。

= 常见问题 FAQ

+ _如何删除版本信息？_\
  在 `elegantnote.with(...)` 中不传 `version` 参数即可。

+ _如何删除日期？_\
  在 `elegantnote.with(...)` 中不传 `date` 参数即可。

+ _如何添加多个作者？_\
  目前 `author` 参数为字符串，多个作者可以用 `"作者1 / 作者2"` 的形式传入，或在正文中自行排版。

+ _如何获得 A4 大小的 PDF？_\
  使用 `device: "normal"` 选项。

+ _应该使用哪个编辑器？_\
  推荐使用 VS Code 配合 #link("https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist")[Tinymist] 插件，或使用官方 #link("https://typst.app/")[Typst Web App]。
