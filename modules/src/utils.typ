#import "../config.typ": config

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

/* vim: set ft=typst: */
