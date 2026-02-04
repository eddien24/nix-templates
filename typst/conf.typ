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
