#import "../config.typ": config
#import "../fonts.typ": fonts
#import "../utils.typ": rem

#let heading_setup(doc) = {
  let size = config.heading.size


  show heading.where(level: 1): it => {
    set text(size: rem(size.at(0)))

    it
  }

  show heading.where(level: 2): it => {
    set text(size: rem(size.at(1)))

    it
  }

  show heading.where(level: 3): it => {
    set text(size: rem(size.at(2)))

    it
  }

  show heading: set text(
    font: fonts.strong,
    weight: 575,
  )

  set heading(numbering: "1.1")
  doc
}

/* vim: set ft=typst: */
