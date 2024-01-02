#import "lib/utils.typ": fixed-length-numbering

= Headling Level 1

#lorem(20)
#counter(heading).display()

== Heading Level 2

#lorem(20)
#counter(heading).display()

== Heading Level 2 二级标题

#lorem(20)
#counter(heading).display()

=== Heading Level 3

#lorem(20)
#counter(heading).display()

== Heading Level 2

#lorem(20)
#counter(heading).display()

= Heading Level 1 一级标题

#lorem(20)
#counter(heading).display()

== Heading Level 2

#lorem(20)
#counter(heading).display()

=== Heading Level 3

#lorem(20)
#counter(heading).display()

=== Heading Level 3 三级标题

#lorem(20)

==== Heading Level 4 四级标题

#lorem(20)
#counter(heading).display()#h(1fr)
#counter(heading).display(fixed-length-numbering)#h(1fr)
#counter(heading).display(fixed-length-numbering.with(len: 2))#h(1fr)
#counter(heading).display(fixed-length-numbering.with(len: 6))

== Heading Level 2

#lorem(20)

=== Heading Level 3

#lorem(20)
#counter(heading).display()

/* vim: set ft=typst: */
