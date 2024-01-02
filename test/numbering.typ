#import "lib/colors.typ": red
#import "lib/utils.typ": fixed-length-numbering

Test the behavior of function `fixed-length-numbering`.

#let c = counter("tmp")

#c.display()#h(1fr)
#c.step()
#c.display()#h(1fr)
#c.step()
#c.step()
#c.step()
#c.display()#h(1fr)
#c.step(level: 4)
#c.display()

由此可见, 一个 `counter` 在默认情况下, 会在#text(red)[*中间*]补上 1.

#c.step(level: 3)
#c.display()#h(1fr)
#c.step(level: 5)
#c.display()#h(1fr)
#c.step(level: 2)
#c.display()#h(1fr)
#c.step(level: 3)
#c.display()

由此可见, 一个 `counter` 在默认情况下, 如果你 step 了前面的 level,
他会#text(red)[*遗忘*]后面的 level, 也就是后面的 level 重新洗牌.

#c.update((3, 0, 4, 2, 5, 1))
#c.display()#h(1fr)
#c.display(fixed-length-numbering)#h(1fr)
#c.display(fixed-length-numbering.with(len: 3))#h(1fr)
#c.display(fixed-length-numbering.with(len: 8))

/* vim: set ft=typst: */
