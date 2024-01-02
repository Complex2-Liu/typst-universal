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

/* vim: set ft=typst: */
