#import "src/fonts.typ": fonts_setup

#let init(doc) = {
  show: doc => fonts_setup(doc)

  doc
}

/* vim: set ft=typst: */
