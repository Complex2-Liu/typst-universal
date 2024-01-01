#import "lib/utils.typ": deep-merge
#import "lib/config.typ": config

We provide two sets of data to test the function `deep-merge`.

// Test deep-merge function
#let dict1 = (
  a: 1,
  b: (
    c: 2,
    d: 3,
  ),
)
#dict1

#let dict2 = (
  b: (
    c: 4,
    e: 5,
  ),
  f: 6,
)
#dict2

#deep-merge(dict1, dict2)

#v(1cm)

#let dict3 = (
  x: (
    y: (
      z: 5,
      v: 6,
    ),
    p: 7,
    q: 8,
  ),
)
#dict3

#let dict4 = (
  x: (
    y: (
      z: 6,
      w: 6,
    ),
    p: 8,
  ),
  r: 8,
)
#dict4

#deep-merge(dict3, dict4)

#v(1cm)

Print the value of our `config`:

#config

/* vim: set ft=typst: */
