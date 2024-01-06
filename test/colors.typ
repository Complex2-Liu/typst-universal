#import "lib/config.typ": config
#import "lib/colors.typ": *
#import "lib/fonts.typ": fonts

Print the value of `colors`:

#colors

#pagebreak()

#set page(margin: (x: 2cm, y: 1.5cm))

#align(center)[
  #text(size: 1.5em, font: fonts.sans, weight: 575)[
    My Color Palette
  ]
]

#grid(
  columns: 3,
  rows: 3,
  row-gutter: 1em,
  column-gutter: 1fr,
  [`red     `] + box(width: 2em, height: 8pt, fill: red, outset: (y: 2pt)) + [ #red],
  [`green   `] + box(width: 2em, height: 8pt, fill: green, outset: (y: 2pt)) + [ #green],
  [`blue    `] + box(width: 2em, height: 8pt, fill: blue, outset: (y: 2pt)) + [ #blue],
  [`orange  `] + box(width: 2em, height: 8pt, fill: orange, outset: (y: 2pt)) + [ #orange],
  [`purple  `] + box(width: 2em, height: 8pt, fill: purple, outset: (y: 2pt)) + [ #purple],
  [`yellow  `] + box(width: 2em, height: 8pt, fill: yellow, outset: (y: 2pt)) + [ #yellow],
  [`black   `] + box(width: 2em, height: 8pt, fill: black, outset: (y: 2pt)) + [ #black],
  [`magenta `] + box(width: 2em, height: 8pt, fill: magenta, outset: (y: 2pt)) + [ #magenta],
  [`grey    `] + box(width: 2em, height: 8pt, fill: grey, outset: (y: 2pt)) + [ #grey],
)

/* vim: set ft=typst: */
