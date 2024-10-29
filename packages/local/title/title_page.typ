#let conf(
  title: none,
  authors: (),
  date: none,
  abstract: [],
  font: "Linux Libertine",
  doc,
) = {
  set par(
  justify: true,
  leading: 0.52em
  )
  set page(
    paper: "us-letter",
    header: align(right)[#title],
    numbering: "1"
  )
  set heading(numbering: "1.")
  show heading.where(level: 1): it => {
    set align(center)
    set text(14pt, weight: "regular")
    smallcaps(it)
  }
  show heading.where(level: 2): it => {
    set text(12pt, weight: "regular", style: "italic")
    smallcaps(it)
  }
  set align(center)
  set text(
    font: font,
    size: 11pt,
  )
  text(17pt, title, font: font)

  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name \
      #link("mailto:" + author.email)
    ]),
  )

  align(center)[#datetime(month:date.month, day:date.day, year:date.year).display("[month repr:long] [day] [year]")]

  par(justify: false)[
    *Abstract* \
    #abstract
  ]

  set align(left)
  columns(2, doc)
}
