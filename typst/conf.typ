#let conf(
  name: "Hiya",
  title: "A Title",
  date: "4.20.69",
  doc,
) = {
  set page(header: [
    #smallcaps[#name] #h(1fr)
    #smallcaps[#title] #h(1fr)
    #smallcaps[#date]
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
