#import "../config.typ": config
#import "../fonts.typ": fonts
#import "../utils.typ": rem, hashstep, attach-hash
#import "../colors.typ": colors

#let hashheading(hash: none, level: 1, body) = {
  hashstep(hash)
  // Here we must apply a block to the heading again...
  block(
    above: config.spacing + rem(0.5), below: config.spacing,
    attach-hash + heading(level: level, body),
  )
}

#let heading_setup(doc) = {
  let size = config.heading.size
  let head-level = config.heading.counter-level
  let math-level = config.math.counter-level
  let stroke = (:)
  let inset = (:)
  let prefix1 = ""
  let prefix2 = ""


  if config.heading.underline {
    stroke = (bottom: 1pt + colors.border.muted)
    inset = (bottom: 0.3em)
  }
  if config.heading.section-symbol {
    prefix1 = text(size: 1.2em, sym.section)
    prefix2 = text(
      size: 1.2em, box(inset: (right: rem(-0.25)), sym.section) + sym.section,
    )
  }


  show heading.where(level: 1): it => {
    if math-level > 1 {
      counter("mathenv").update(0)
      counter(math.equation).update(0)
    }
    let prefix3 = " "
    if head-level >= 1 {
      prefix3 = counter(heading).display() + ". "
    }

    set text(size: rem(size.at(0)))

    block(
      width: 100%, above: config.spacing + rem(0.5), below: config.spacing,
      stroke: stroke,
      inset: inset,
      prefix1 + sym.space.med + prefix3 + it.body
    )
  }

  show heading.where(level: 2): it => {
    if math-level > 2 {
      counter("mathenv").update(0)
      counter(math.equation).update(0)
    }
    let prefix4 = " "
    if head-level >= 2 {
      prefix4 = counter(heading).display() + ". "
    }

    set text(size: rem(size.at(1)))

    block(
      width: 100%, above: config.spacing + rem(0.5), below: config.spacing,
      stroke: stroke,
      inset: inset,
      prefix2 + sym.space.med + prefix4 + it.body
    )
  }

  show heading.where(level: 3): it => {
    if math-level > 3 {
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
  show heading: set block(
    above: config.spacing + rem(0.5), below: config.spacing
  )

  set heading(numbering: "1.1")
  doc
}

/* vim: set ft=typst: */
