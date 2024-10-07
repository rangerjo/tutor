#import "@preview/tidy:0.2.0"
#import "/lib.typ"

#let docs = tidy.parse-module(
  read("/lib.typ"),
  name: "tutor",
  scope: (tutor: lib)
  )
#let VERSION = toml("/typst.toml").package.version

#align(center)[
  #text(size: 24pt)[tutor] \
  #datetime.today().display() - Jonas Amstutz - Version #VERSION
]

- question mode: No solutions
- solution mode: Show solutions
- exercise mode: No points, no comments on how points are distributed when correcting an exam 
- test mode: Show points and comments on how points are distributed when correcting an exam (in solution mode). 

#tidy.show-module(docs, style: tidy.styles.default)
