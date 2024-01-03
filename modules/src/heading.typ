#import "../config.typ": config
#import "../fonts.typ": fonts
#import "../utils.typ": rem

#let heading_setup(doc) = {
  let size = config.heading.size
  let level = config.math.counter-level


  show heading.where(level: 1): it => {
    if level > 1 {
      counter("mathenv").update(0)
      counter(math.equation).update(0)
    }
    set text(size: rem(size.at(0)))

    it
  }

  show heading.where(level: 2): it => {
    if level > 2 {
      counter("mathenv").update(0)
      counter(math.equation).update(0)
    }
    set text(size: rem(size.at(1)))

    it
  }

  show heading.where(level: 3): it => {
    if level > 3 {
      counter("mathenv").update(0)
      counter(math.equation).update(0)
    }
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
