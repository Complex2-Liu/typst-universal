#import "lib/config.typ": config
#import "lib/math.typ": mathenv, proof, subproof, solution, note
#import "lib/math.typ": cref

尝试将 `math.counter-level` 修改为 0, 1, 2, 3, 检查 `counter` 是否正确显示.

= Heading Level 1 一级标题

#mathenv(hash: "c8170cb")[
  Every bounded entire function must be constant.
] <c8170cb>

#proof[
  留作习题答案略.
]

#lorem(30)

#mathenv(desp: [Liouville's Theorem])[
  Every bounded entire function must be constant.
] <0cbf7c5>

#subproof[
  显然易见平凡.
]

#lorem(30)

== Heading Level 2 二级标题

#lorem(30)

#mathenv(name: "Proposition", hash: "453e95c")[
  Every bounded entire function must be constant.
] <453e95c>

#lorem(30)

#mathenv()[
  Every bounded entire function must be constant.
] <e12eb34>

#solution[
  留作习题答案略.
]

#solution(name: "另解")[
  显然易见平凡.
]

#lorem(30)

=== Heading Level 3 三级标题

#lorem(30)

#mathenv(name: [Lemma], desp: [Liouville's Theorem])[
  Every bounded entire function must be constant.
] <d15a513>

#note(name: "Remark")[
  再给出一个 Remark.
]

#lorem(30)

= Heading Level 2 一级标题

#lorem(30)

#mathenv()[
  Every bounded entire function must be constant.
] <2ea0fa5>

#lorem(30)

#pagebreak()

测试 `#cref` 是否表现正常.

#lorem(50)
#cref(hash: false, "c8170cb")[Theorem],
#cref(hash: true, "c8170cb")[Theorem],
#cref(hash: false, "0cbf7c5")[Theorem],
#cref(hash: true, "0cbf7c5")[Theorem],
Theorem #cref("e12eb34"),
Theorem #cref(hash: true, "e12eb34"),
Lemma #cref("d15a513"),
Lemma #cref(hash: true, "d15a513").

/* vim: set ft=typst: */
