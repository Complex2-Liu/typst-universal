#import "lib/config.typ": config
#import "lib/math.typ": numbeq, hasheq, eqref
#import "lib/utils.typ": stable-mark

#set block(above: config.spacing, below: config.spacing)
#show heading: set block(below: config.spacing)

= Heading Level 1

#lorem(30)

#stable-mark
#numbeq[
  $
  a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
  a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
  $
] <0194d98>

#lorem(30)
$
a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
$
#lorem(30)

== Heading Level 2

#lorem(30)
#numbeq[
  $
  a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
  a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
  $
]
#lorem(30)
  $
  a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
  a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
  $
#lorem(30)
#numbeq[
  $
  a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
  a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
  $
] <34e3bd5>

=== Heading Level 3

#lorem(30)

#hasheq(hash: "024eefc")[
  $
  a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
  a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
  $
] <024eefc>
#lorem(30)
#numbeq[
  $
  a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
  a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
  $
]

#import "lib/math.typ": mathenv

#stable-mark
#mathenv(hash: "011a010")[
  #lorem(20)
]

#lorem(30)

== Heading Level 2

#lorem(30)
#numbeq[
  $
  a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
  a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
  $
] <3aeb150>

= Heading Level 1

#lorem(30)
#numbeq[
  $
  a_1 + a_2 + a_3 + a_4 + a_5 + a_6 +
  a_7 + a_8 + a_9 + a_(10) + a_(11) + a_(12)
  $
]

Equation #eqref("0194d98")
#eqref("34e3bd5")[Equation]
Equation #eqref(hash: true, "024eefc")
#eqref("3aeb150")[Equation]

/* vim: set ft=typst: */
