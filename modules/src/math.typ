#import "../config.typ": config
#import "../fonts.typ": fonts
#import "../utils.typ": has, rem, hashstep, attach-hash

// Math Environments

/// Mathenv counter
/// offset is used to adjust the counter for cref defined below.
///
/// @param loc location
/// @param offset? integer
/// @return content
#let mathenv-counter(loc, offset: 0) = {
  let c = none
  let level = config.math.counter-level

  if level > 0 {
    import "../utils.typ": fixed-length-numbering

    let arr = counter(heading).at(loc)
    c = c + fixed-length-numbering.with(len: level - 1)(..arr)
    if level > 1 { c = c + "." }
    let a = counter("mathenv").at(loc).first()
    if offset > 0 { a = a + 1 }
    c = c + str(a)
  }

  return c
}

/// Title of math environment, including counter and description.
///
/// @param name? string
/// @param desp? content
#let mathenv-title(name: "Theorem", desp: none) = {
  let c = strong(name)

  if config.math.counter-level > 0 {
    c = c + " " + strong(locate(loc => { mathenv-counter(loc) }))
  }

  if has(desp) {
    c = c + " " + "(" + desp + ")" + strong(".")
  } else {
    c = c + strong(".")
  }

  return c
}

/// Foundation of mathenv
///
/// @param body content
/// @param name? string
/// @param style? "plain"
/// @param spacing? length
/// @param desp? content
/// @param hash? string 7-digit SHA256 hash
#let mathenv(
  body, name: "Theorem", style: "plain",
  spacing: config.spacing, desp: none, hash: none
  ) = {
  counter("mathenv").step()
  if has(hash) { hashstep(hash) }

  if style == "plain" {
    block(above: spacing, below: spacing, width: 100%)[
      #if has(hash) { attach-hash }
      #mathenv-title(name: name, desp: desp)
      #body
    ]
  }

  // TODO: add "fancy" style
}

// Other common math environments including
// proof, subproof, solution, and note (remark).

#let proof(body, spacing: config.spacing, name: "Proof") = {
  let c = {
    emph(name + ".") + body + h(1fr) + sym.wj + $square.stroked$
  }
  block(above: spacing, below: spacing, width: 100%, c)
}

#let subproof(body, spacing: config.spacing, name: "Proof") = {
  let c = {
    emph(name + ".") + body + h(1fr) + sym.wj + $square.filled$
  }
  block(above: spacing, below: spacing, width: 100%, c)
}

#let solution(body, spacing: config.spacing, name: "Solution") = {
  let c = {
    emph(name + ".") + body
  }
  block(above: spacing, below: spacing, width: 100%, c)
}

#let note(body, spacing: config.spacing, name: "Note") = {
  let c = {
    strong(name + ".") + body
  }
  block(above: spacing, below: spacing, width: 100%, c)
}

/// Clever reference.
///
/// @param target string
/// @param hash? boolean
/// @return content
#let cref(target, hash: false, ..args) = {
  import "../colors.typ": blue

  let supplement = args.pos().at(0, default: none)
  if has(supplement) { supplement = supplement + " " }

  if hash {
    show link: set text(font: fonts.mono, fill: blue, size: rem(0.8))
    supplement + link(label(target), target)
  } else {
    locate(loc => {
      let elem = query(label(target), loc)
      let c = mathenv-counter.with(offset: 1)(elem.first().location())

      show link: set text(fill: blue)

      supplement + link(label(target), c)
    })
  }
}

/// Equation reference.
///
#let eqref(target, hash: false, ..args) = {
  import "../colors.typ": blue
  import "../utils.typ": fixed-length-numbering

  let supplement = args.pos().at(0, default: none)
  if has(supplement) { supplement = supplement + " " }

  if hash {
    show link: set text(font: fonts.mono, fill: blue, size: rem(0.8))
    supplement + link(label(target), target)
  } else {
    locate(loc => {
      let level = config.math.counter-level
      let elem = query(label(target), loc)
      let loc = elem.first().location()
      let arr = counter(heading).at(loc)
      let c = fixed-length-numbering.with(len: level - 1)(..arr)
      if level > 1 { c = c + "." }
      c = c + str(counter(math.equation).at(loc).first())

      show link: set text(fill: blue)
      supplement + link(label(target), c)
    })
  }
}

#import "../utils.typ": eq-numbering, hash-eq-numbering

#let numbeq(body) = {
  math.equation(block: true, numbering: eq-numbering, body)
}

#let hasheq(hash: none, body) = {
  if not has(hash) { panic("hash is required") }
  hashstep(hash)
  math.equation(block: true, numbering: hash-eq-numbering, body)
  counter(math.equation).update(n => n - 1)
}


/* vim: set ft=typst: */
