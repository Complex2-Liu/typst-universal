#import "../config.typ": config
#import "./config.typ": fonts
#import "../colors.typ": colors

#let fonts_setup(doc) = {
  set text(
    font: fonts.normal,
    fallback: false,
    fill: colors.fg.default,
    size: config.font-size,
  )
  show emph: it => {
    text(
      font: fonts.italic,
      style: "italic",
      it.body
    )
  }
  show strong: it => {
    text(
      font: fonts.strong,
      weight: 575,
      it.body
    )
  }
  show raw: set text(font: fonts.mono)
  show math.equation: set text(font: fonts.math)

  doc
}

/* vim: set ft=typst: */
