// =============================================================================
// ElegantNote-Typst — English Demo
// elegantnote-en.typ
// =============================================================================

#import "elegantnote.typ": *

#show: elegantnote.with(
  title:     [ElegantNote: An Elegant Typst Template for Notes],
  author:    "Author",
  institute: "ElegantLaTeX Program",
  date:      "June, 2026",
  version:   "1.0",
  logo:      "image/logo-blue.png",
  color:     "blue",   // blue | green | cyan | sakura | black | brown
  mode:      "sepia",  // none | geye | hazy | sepia
  device:    "normal", // pad | pc | kindle | normal | screen
  lang:      "en",
)

= ElegantNote User Guide
This template has been rebuilt natively for Typst since 2026. The typographic style is inspired by #link("https://github.com/ElegantLaTeX/ElegantNote")[ElegantNote] (the original LaTeX version).

The new template has the following features:

- Background modes: good for eye (`geye`), hazy (`hazy`), and sepia (`sepia`);
- Different devices: Pad (default), Screen (beamer size), Kindle, PC (double-page) and normal (A4);
- 6 color themes: `blue` (default), `green`, `cyan`, `sakura`, `black`, `brown`;
- Languages support: Chinese (default), English;
- Prettier captions, list environments, and unified fonts;
- Support for math font options via Typst native math.

== Optional Modes

This template provides three background modes: good for eye (`mode: "geye"`), hazy (`mode: "hazy"`), and sepia (`mode: "sepia"`). The paper color is green for geye, light off-white for hazy, and warm brown for sepia:

```typst
#show: elegantnote.with(mode: "geye")   // green background
#show: elegantnote.with(mode: "hazy")   // off-white background
#show: elegantnote.with(mode: "sepia")  // warm sepia background
```

#note(color: "blue", lang: "en")[
  To use a fully custom background color, add `set page(fill: ...)` after the `#show: elegantnote.with(...)` call.
]

== Device Options

To make the notes more comfortable to read on different devices:

```typst
#show: elegantnote.with(device: "pad")     // iPad screen size (default)
#show: elegantnote.with(device: "kindle")  // Kindle screen size
#show: elegantnote.with(device: "pc")      // double pages for PC
#show: elegantnote.with(device: "normal")  // A4 normal page
#show: elegantnote.with(device: "screen")  // 4:3 presentation size
```

#note(color: "blue", lang: "en")[
  To get a normal A4 size PDF, please select `device: "normal"`.
]

== Color Themes

This template contains 6 color themes: `blue` (default), `green`, `cyan`, `sakura`, `black`, `brown`. The color theme affects headings, theorem labels, list markers, links, and all colored elements:

```typst
#show: elegantnote.with(color: "green")
#show: elegantnote.with(color: "cyan")
#show: elegantnote.with(color: "sakura")
#show: elegantnote.with(color: "black")
#show: elegantnote.with(color: "brown")
```

== Languages

This template contains two language environments. Changing the language will change figure/table captions, theorem introductory words, etc.:

```typst
#show: elegantnote.with(lang: "cn")  // Chinese (default)
#show: elegantnote.with(lang: "en")  // English
```

#note(color: "blue", lang: "en")[
  Chinese characters are allowed in Chinese mode only. To type Chinese in English mode, manually set the font in your document.
]

== Theorem Class Environments

This template provides 4 types of theorem environments:

- *Theorem-Class*: `theorem`, `lemma`, `proposition`, `corollary`;
- *Definition-Class*: `definition`, `conjecture`, `example`;
- *Remark-Class*: `remark`, `note`, `case`;
- *Proof-Class*: `proof`.

#remark(color: "blue", lang: "en")[
  With the option `lang: "cn"`, the introductory words of the theorem class environments will be changed to Chinese.
]

= Writing Sample

We will define the integral of a measurable function in three steps. First, we define the integral of a nonnegative simple function. Let $E$ be the measurable set in $cal(R)^N$.

#definition(name: "Left Coset", color: "blue", lang: "en")[
  Let $H$ be a subgroup of a group $G$. A _left coset_ of $H$ in $G$ is a subset of $G$ that is of the form $x H$, where $x in G$ and $x H = { x h : h in H }$. Similarly a _right coset_ of $H$ in $G$ is a subset of $G$ that is of the form $H x$, where $H x = { h x : h in H }$.
]

Note that a subgroup $H$ of a group $G$ is itself a left coset of $H$ in $G$.

#lemma(name: "Size of Left Coset", color: "blue", lang: "en")[
  Let $H$ be a finite subgroup of a group $G$. Then each left coset of $H$ in $G$ has the same number of elements as $H$.
]

#theorem(name: "Lagrange's Theorem", color: "blue", lang: "en")[
  Let $G$ be a finite group, and let $H$ be a subgroup of $G$. Then the order of $H$ divides the order of $G$.
]

#proof(color: "blue", lang: "en")[
  Let $z$ be some element of $x H inter y H$. Then $z = x a$ for some $a in H$, and $z = y b$ for some $b in H$. If $h$ is any element of $H$ then $a h in H$ and $a^(-1) h in H$, since $H$ is a subgroup of $G$. But $z h = x(a h)$ and $x h = z(a^(-1) h)$ for all $h in H$. Therefore $z H subset x H$ and $x H subset z H$, and thus $x H = z H$. Similarly $y H = z H$, and thus $x H = y H$, as required.
]

#figure(
  image("image/scatter.pdf", width: 60%),
  caption: [Matplotlib: Scatter Plot Example],
) <fig-scatter>

Regression analysis is a powerful statistical method that allows you to examine the relationship between two or more variables of interest. While there are many types of regression analysis, at their core they all examine the influence of one or more independent variables on a dependent variable. The process of performing a regression allows you to confidently determine which factors matter most, which factors can be ignored, and how these factors influence each other.

Let's continue using our application training example. In this case, we'd want to measure the historical levels of satisfaction with the events from the past three years or so, as well as any information possible in regards to the independent variables.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    table.header([], [(1)], [(2)]),
    [mpg],      [-238.90\*\*\*], [-49.51],
    [],         [(53.08)],       [(86.16)],
    [weight],   [],              [1.75\*\*\*],
    [],         [],              [(0.641)],
    [constant], [11,253\*\*\*],  [1,946],
    [],         [(1,171)],       [(3,597)],
    [obs],      [74],            [74],
    [$R^2$],    [0.220],         [0.293],
    table.cell(colspan: 3, align: left)[#text(size: 8pt)[Standard errors in parentheses]],
    table.cell(colspan: 3, align: left)[#text(size: 8pt)[\*\*\* $p < 0.01$, \*\* $p < 0.05$, \* $p < 0.1$]],
  ),
  caption: [Auto MPG and Price],
) <tab-auto>

= Acknowledgement

Thank the #link("https://github.com/ElegantLaTeX/ElegantNote")[ElegantNote] (LaTeX version) project for the excellent typographic design that inspired this template.

If you like this template, please give us a star on #link("https://github.com/Iorest/ElegantNote-Typst")[GitHub].

= FAQ

+ _How to remove the version information?_\
  Simply omit the `version` parameter in `elegantnote.with(...)`.

+ _How to remove the date?_\
  Simply omit the `date` parameter in `elegantnote.with(...)`.

+ _How to add multiple authors?_\
  The `author` parameter is a string. You can use `"Author1 / Author2"` or typeset authors manually in the body.

+ _How to get an A4 PDF?_\
  Use `device: "normal"`.

+ _Which editor should I use?_\
  VS Code with the #link("https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist")[Tinymist] extension, or the official #link("https://typst.app/")[Typst Web App].
