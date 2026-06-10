// =============================================================================
// ElegantNote-Typst
// 优雅的 Typst 笔记模板 | An Elegant Typst Template for Notes
// https://github.com/Iorest/ElegantNote-Typst
// Style inspired by ElegantNote (LaTeX): https://github.com/ElegantLaTeX/ElegantNote
// =============================================================================

// ---------------------------------------------------------------------------
// Color themes
// ---------------------------------------------------------------------------

#let _colors = (
  blue:   rgb(1,   126, 218),
  green:  rgb(0,   120, 2),
  cyan:   rgb(31,  186, 190),
  sakura: rgb(255, 183, 197),
  black:  rgb(0,   0,   0),
  brown:  rgb(109, 62,  18),
)

// Background (mode) colors
#let _bg-colors = (
  geye:  rgb(199, 237, 204),  // 护眼绿豆沙
  hazy:  rgb(251, 250, 248),  // 朦胧米白
  sepia: rgb(250, 237, 225),  // 复古棕黄
)

// ---------------------------------------------------------------------------
// Device page sizes
// ---------------------------------------------------------------------------

#let _device-page(device) = {
  if device == "pad" {(
    width:  6in,
    height: 8in,
    margin: 8mm,
  )} else if device == "pc" {(
    width:  6.2in,
    height: 6in,
    margin: 8mm,
  )} else if device == "kindle" {(
    width:  3.68in,
    height: 4.92in,
    margin: 8mm,
  )} else if device == "screen" {(
    width:  25.4cm,
    height: 19.05cm,
    margin: 1.6cm,
  )} else {
    // normal — A4
    none
  }
}

// ---------------------------------------------------------------------------
// Main template function
// ---------------------------------------------------------------------------

#let elegantnote(
  title:     none,
  author:    none,
  institute: none,
  date:      none,
  version:   none,
  logo:      none,     // 封面 logo 路径，如 "image/logo.png"
  // Appearance
  color:     "blue",   // blue | green | cyan | sakura | black | brown
  mode:      none,     // none | geye | hazy | sepia（暖米黄/牛皮纸色）
  device:    "pad",    // pad | pc | kindle | normal | screen
  // Language
  lang:      "cn",
  // Content
  body,
) = {

  // Resolve theme color
  let ecolor = if color in _colors { _colors.at(color) } else { _colors.blue }

  // Language strings
  let strings = if lang == "cn" {(
    contents:     "目录",
    figure:       "图",
    table:        "表",
    bibliography: "参考文献",
    proof:        "证明",
    theorem:      "定理",
    lemma:        "引理",
    proposition:  "命题",
    corollary:    "推论",
    definition:   "定义",
    conjecture:   "猜想",
    example:      "例",
    remark:       "评论",
    note:         "注",
    case:         "案例",
    version-label:"版本：",
    date-label:   "更新：",
  )} else {(
    contents:     "Contents",
    figure:       "Figure",
    table:        "Table",
    bibliography: "Bibliography",
    proof:        "Proof",
    theorem:      "Theorem",
    lemma:        "Lemma",
    proposition:  "Proposition",
    corollary:    "Corollary",
    definition:   "Definition",
    conjecture:   "Conjecture",
    example:      "Example",
    remark:       "Remark",
    note:         "Note",
    case:         "Case",
    version-label:"Version: ",
    date-label:   "Update: ",
  )}

  // ---- Document settings ----
  set document(
    title: if title != none { title } else { "ElegantNote" },
    author: if author != none { author } else { "" },
  )

  // Page layout
  // Note: set rules inside if/else branches don't persist in Typst,
  // so we compute all values first, then call set page once at top level.
  let bg-fill = if mode != none and mode in _bg-colors { _bg-colors.at(mode) } else { white }
  let pg = _device-page(device)
  let page-width  = if pg != none { pg.width  } else { 210mm }
  let page-height = if pg != none { pg.height } else { 297mm }
  let page-margin = if pg != none { pg.margin } else { 1in }

  set page(
    width:   page-width,
    height:  page-height,
    margin:  page-margin,
    fill:    bg-fill,
    footer:  context {
      set text(fill: luma(120), size: 9pt)
      align(center, str(here().page()))
    },
    header: none,
  )

  set text(
    font: ("Libertinus Serif", "Songti SC"),
    size: 11pt,
    lang: lang,
  )

  // linespread 1.3, parskip 3mm
  set par(
    justify:           true,
    leading:           0.78em,
    first-line-indent: 2em,
    spacing:           1.2em,
  )

  // ---- Heading styles (colored) ----
  set heading(numbering: "1.1")

  show heading.where(level: 1): it => {
    v(1em)
    block({
      set text(fill: ecolor, size: 16pt, weight: "bold")
      if it.numbering != none {
        counter(heading).display("1") + "　" + it.body
      } else {
        it.body
      }
    })
    v(0.4em)
  }

  show heading.where(level: 2): it => {
    v(0.6em)
    block({
      set text(fill: ecolor, size: 13pt, weight: "bold")
      if it.numbering != none {
        counter(heading).display("1.1") + "　" + it.body
      } else {
        it.body
      }
    })
    v(0.2em)
  }

  show heading.where(level: 3): it => {
    v(0.4em)
    block({
      set text(fill: ecolor, size: 11pt, weight: "bold")
      if it.numbering != none {
        counter(heading).display("1.1.1") + "　" + it.body
      } else {
        it.body
      }
    })
    v(0.1em)
  }

  // ---- Figure/table captions (colored bold label) ----
  set figure(gap: 3pt)
  show figure.caption: it => {
    set text(size: 9pt)
    text(fill: ecolor, weight: "bold",
      it.supplement + " " + it.counter.display(it.numbering) + it.separator
    )
    it.body
  }

  // ---- Links ----
  show link: it => {
    set text(fill: ecolor)
    it
  }

  // ---- Code blocks ----
  show raw.where(block: true): it => {
    set text(font: ("JetBrainsMono NF", "Sarasa Mono SC", "Menlo"), size: 9pt)
    block(
      fill:   luma(235),
      stroke: none,
      radius: 2pt,
      inset:  8pt,
      width:  100%,
      it,
    )
  }

  show raw.where(block: false): it => {
    set text(font: ("JetBrainsMono NF", "Sarasa Mono SC", "Menlo"), size: 9.5pt)
    box(
      fill:   luma(235),
      stroke: none,
      radius: 2pt,
      inset:  (x: 3pt, y: 1pt),
      it,
    )
  }

  // ---- Colored list bullets ----
  set list(
    marker: (
      text(fill: ecolor, "●"),
      text(fill: ecolor, "◉"),
      text(fill: ecolor, "○"),
    ),
  )
  set enum(
    numbering: (..n) => text(fill: ecolor, numbering("1.", ..n)),
  )

  // ---- Title page ----
  if title != none {
    set par(first-line-indent: 0pt)
    v(1fr)
    align(center, {
      if logo != none {
        image(logo, width: 18%)
        v(1em)
      }
      text(fill: ecolor, size: 20pt, weight: "bold", title)
      v(1.5em)
      if author != none {
        text(size: 13pt, author)
        linebreak()
      }
      if institute != none {
        text(size: 11pt, fill: luma(60), institute)
        linebreak()
      }
      v(0.3em)
      set text(size: 10pt, style: "italic", fill: luma(80))
      if version != none {
        strings.version-label + version
        linebreak()
      }
      if date != none {
        strings.date-label + date
      }
    })
    v(1fr)
    // 标题页不显示页码
    counter(page).update(0)
    pagebreak()
  }

  // ---- Body ----
  body
}

// ---------------------------------------------------------------------------
// Theorem-like environments  (colored label, italic body)
// ---------------------------------------------------------------------------

// Shared counter for theorem/lemma/proposition (per section)
#let _thm-cnt = counter("en-theorem")
#let _def-cnt = counter("en-definition")
#let _con-cnt = counter("en-conjecture")
#let _exa-cnt = counter("en-example")

// Generic builder
#let _thm-env(cnt, label, ecolor, named, body) = {
  cnt.step()
  block(
    width: 100%,
    above: 8pt,
    below: 8pt,
    {
      context {
        let sec = counter(heading.where(level: 1)).get().first()
        let n   = cnt.get().first()
        let num = str(sec) + "." + str(n)
        if named != none {
          text(fill: ecolor, weight: "bold", style: "italic",
            label + " " + num + " (" + named + ")　")
        } else {
          text(fill: ecolor, weight: "bold", style: "italic",
            label + " " + num + "　")
        }
      }
      text(style: "italic", body)
    }
  )
}

// Unnumbered builder
#let _thm-env-nonum(label, ecolor, body) = {
  block(
    width: 100%,
    above: 6pt,
    below: 6pt,
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      text(fill: ecolor, weight: "bold", label),
      body,
    )
  )
}

/// Theorem
#let theorem(name: none, color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "定理" } else { "Theorem" }
  _thm-env(_thm-cnt, lbl, ec, name, body)
}

/// Lemma
#let lemma(name: none, color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "引理" } else { "Lemma" }
  _thm-env(_thm-cnt, lbl, ec, name, body)
}

/// Proposition
#let proposition(name: none, color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "命题" } else { "Proposition" }
  _thm-env(_thm-cnt, lbl, ec, name, body)
}

/// Corollary (unnumbered)
#let corollary(name: none, color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "推论" } else { "Corollary" }
  block(
    width: 100%,
    above: 8pt,
    below: 8pt,
    {
      if name != none {
        text(fill: ec, weight: "bold", style: "italic", lbl + " (" + name + ")　")
      } else {
        text(fill: ec, weight: "bold", style: "italic", lbl + "　")
      }
      text(style: "italic", body)
    }
  )
}

/// Definition
#let definition(name: none, color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "定义" } else { "Definition" }
  _def-cnt.step()
  block(
    width: 100%,
    above: 8pt,
    below: 8pt,
    {
      context {
        let sec = counter(heading.where(level: 1)).get().first()
        let n   = _def-cnt.get().first()
        let num = str(sec) + "." + str(n)
        if name != none {
          text(fill: ec, weight: "bold", lbl + " " + num + " (" + name + ")　")
        } else {
          text(fill: ec, weight: "bold", lbl + " " + num + "　")
        }
      }
      body
    }
  )
}

/// Conjecture
#let conjecture(name: none, color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "猜想" } else { "Conjecture" }
  _con-cnt.step()
  block(
    width: 100%,
    above: 8pt,
    below: 8pt,
    {
      context {
        let sec = counter(heading.where(level: 1)).get().first()
        let n   = _con-cnt.get().first()
        let num = str(sec) + "." + str(n)
        if name != none {
          text(fill: ec, weight: "bold", lbl + " " + num + " (" + name + ")　")
        } else {
          text(fill: ec, weight: "bold", lbl + " " + num + "　")
        }
      }
      body
    }
  )
}

/// Example
#let example(name: none, color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "例" } else { "Example" }
  _exa-cnt.step()
  block(
    width: 100%,
    above: 8pt,
    below: 8pt,
    {
      context {
        let sec = counter(heading.where(level: 1)).get().first()
        let n   = _exa-cnt.get().first()
        let num = str(sec) + "." + str(n)
        if name != none {
          text(fill: ec, weight: "bold", lbl + " " + num + " (" + name + ")　")
        } else {
          text(fill: ec, weight: "bold", lbl + " " + num + "　")
        }
      }
      body
    }
  )
}

/// Remark (unnumbered)
#let remark(color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "评论" } else { "Remark" }
  _thm-env-nonum(lbl, ec, body)
}

/// Note (unnumbered)
#let note(color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "注" } else { "Note" }
  _thm-env-nonum(lbl, ec, body)
}

/// Case (unnumbered)
#let case(color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "案例" } else { "Case" }
  _thm-env-nonum(lbl, ec, body)
}

/// Proof (ends with □, colored label)
#let proof(color: "blue", lang: "cn", body) = {
  let ec = if color in _colors { _colors.at(color) } else { _colors.blue }
  let lbl = if lang == "cn" { "证明　" } else { "Proof　" }
  block(
    width: 100%,
    above: 6pt,
    below: 6pt,
    {
      text(fill: ec, weight: "bold", style: "italic", lbl)
      body
      h(1fr)
      $square$
    }
  )
}

// ---------------------------------------------------------------------------
// Utility commands
// ---------------------------------------------------------------------------

/// Email link
#let email(address) = link("mailto:" + address, address)

/// Appendix helper
#let appendix(lang: "cn", body) = {
  counter(heading).update(0)
  set heading(numbering: "A.1")
  body
}
