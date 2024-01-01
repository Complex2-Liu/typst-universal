#import "../config.typ": config
#import "./config.typ": colors

// convert the string type to color type
#let load-palette(dict) = {
  assert(type(dict) == dictionary, message: "dict must be a dictionary")

  let final = (:)
  for (k, v) in dict {
    let tmp = (:)
      for (x, y) in v {
        tmp.insert(x, rgb(y))
      }
    final.insert(k, tmp)
  }
  final
}

#let colors = load-palette(colors)
#let black = colors.fg.default
#let white = colors.bg.default
#let grey = colors.fg.muted
#let red = colors.fg.red
#let green = colors.fg.green
#let blue = colors.fg.blue
#let orange = colors.fg.orange
#let yellow = colors.fg.yellow
#let purple = colors.fg.purple
#let magenta = colors.fg.magenta

/* vim: set ft=typst: */
