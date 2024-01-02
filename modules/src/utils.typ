#import "../config.typ": config
#import "../fonts.typ": fonts
#import "../colors.typ": colors

/// Check if the given value is defined.
///
/// @param v any
/// @return boolean
#let has(v) = {
  type(v) != type(none)
}

/// Create a box with a width equal to the argument, but a height equal to zero
///
/// @param s content
/// @return content
#let hphantom(s) = { hide(box(height: 0em, s)) }

/// Root em, like html rem
///
/// @param n integer
/// @return length
#let rem(n) = { n * config.font-size }

// Utilities for various numbering

/// Numbering in a given length by appending zeros at the end of the array.
#let fixed-length-numbering(len: 1, ..nums) = {
  let a = nums.pos()
  let nums_len = a.len()

  if len == 0 { return none }
  if nums_len > len {
    a = nums.pos().slice(0, count: len)
  } else {
    for i in range(0, len - nums_len) {
      a.push(0)
    }
  }

  return a.map(str).join(".")
}

/// Update the hash state with the given string.
///
/// @param s string
/// @return none
#let hashstep(s) = {
  state("hash").update(s)
}

#let mathenv-hash-numbering(v) = {
  set text(font: fonts.mono, size: rem(0.8))
  place(
    right + top, dx: rem(5.2),
    "(" + text(fill: colors.fg.green, state("hash").display()) + ")"
  )
}

#let attach-hash = {
  state("hash").display(mathenv-hash-numbering)
}

/// Stable mark
///
/// @return content
#let stable-mark = {
  let palette = ()
  for i in color.map.rainbow {
    palette.push(i.darken(6%))
  }

  place(
    dx: rem(-4.8), dy: rem(0.1),
    box(
      fill: gradient.linear(..palette, angle: 135deg),
      radius: 6pt,
      outset: (x: 6pt, y:4pt),
      text(font: fonts.sans, fill: white, weight: 800, rem(0.9))[Stable]
    )
  )
}

/* vim: set ft=typst: */
