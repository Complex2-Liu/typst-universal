#import "src/fonts.typ": fonts_setup
#import "src/heading.typ": heading_setup

#let init(doc) = {
  show: doc => fonts_setup(doc)
  show: doc => heading_setup(doc)

  doc
}

/* vim: set ft=typst: */
