#let conf(
  left: "Hiya",
  middle: "A Title",
  right: "4.20.69",
  doc,
) = {
  set page(header: [
    #smallcaps[#left] #h(1fr)
    #smallcaps[#middle] #h(1fr)
    #smallcaps[#right]
  ])

  show heading: it => {
    pagebreak(weak: true)
    set text(fill: gradient.linear(..color.map.rainbow))
    box(it)
    linebreak()
  }

  set par(justify: true)
  set enum(numbering: "a.i.")

  show quote.where(block: true): it => {
    rect(
      stroke: (left: 2pt + rgb("#d0d7de")), // vertical line
      inset: (left: 1em, top: 0.5em, bottom: 0.5em, right: 0em),
      radius: 0pt,
      width: 100%,
      {
        set text(style: "italic", fill: rgb("#57606a"))
        it.body
      },
    )
  }

  set quote(block: true)

  doc
}

#let prob(body) = [= #smallcaps[Problem #body]]

#let inv(it) = $it^(-1)$

#let qed = {
  h(1fr)
  $square.stroked$
}

#let angled(body) = $angle.l body angle.r$
#let apostrophe = sym.quote.single.r
#let modring(num) = $ZZ slash num ZZ$
#let unitring(num) = $(ZZ slash num ZZ)^times$
#let modulo(num) = $space (mod num)$
#let ord = math.op("ord")
#let finfield(num) = $FF_p^*$
#let spacebreak = {
  linebreak()
  h(1fr)
  sym.diamond.filled
  h(1fr)
  linebreak()
  linebreak()
}
