#import "@preview/cetz:0.3.0": *
#let plot(canvass, sizex, sizey, step: 1, vectors: ()) = {
  canvas(
    length: canvass, {
      import draw: *
      set-style(
        mark: (fill: black, scale: 1), stroke: (thickness: 0.4pt, cap: "round"), angle: (fill: green.lighten(80%), stroke: (paint: green.darken(50%))),
      )
      grid(
        (-sizex - 1, -sizey - 1), (sizex + 1, sizey + 1), step: step, stroke: gray + 0.2pt,
      )

      line((-sizex - 1, 0), (sizex + 1, 0), mark: (end: "stealth"))
      content((), $ x $, anchor: "west")
      line((0, -sizey - 1), (0, sizey + 1), mark: (end: "stealth"))
      content((), $ y $, anchor: "south")
      for (x, ct) in range(-sizex, 0, step: step).map(i => { (i, $#i$) }) {
        line((x, 3pt), (x, -3pt))
        content((), anchor: "north", ct)
      }
      for (x, ct) in range(1, sizex + 1, step: step).map(i => { (i, $#i$) }) {
        line((x, 3pt), (x, -3pt))
        content((), anchor: "north", ct)
      }
      for (y, ct) in range(-sizey, 0, step: step).map(i => (i, $#i$)) {
        line((3pt, y), (-3pt, y))
        content((), anchor: "east", ct)
      }
      for (y, ct) in range(1, sizey + 1, step: step).map(i => (i, $#i$)) {
        line((3pt, y), (-3pt, y))
        content((), anchor: "east", ct)
      }
      for vector in vectors {
        line(vector.origin, vector.end, mark: (end: "stealth"), name: "x")
        content("x.mid", [#vector.name], frame: "rect", fill: white, stroke: none)
        if vector.label != none {
          content(vector.label, anchor: "south-east", $ \(vector.end.x, vector.end.y\) $)
        }
      }
    },
  )
}
