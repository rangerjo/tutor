
#import "@local/tutor:0.3.0": totalpoints, lines, default-config

#import "src/ex1/ex.typ" as ex1
#import "src/ex2/ex.typ" as ex2

#let cfg = toml("tutor.toml")

#if sys.inputs.tutor_sol == "true" {
  (cfg.sol = true)
} else if sys.inputs.tutor_sol == "false" {
  (cfg.sol = false)
}

#set heading(numbering: "1.1")

#text(16pt)[
  Name: $underline(#h(15cm))$
  #v(3mm)
  #grid(
    columns: (1fr, 1fr),
    rows: 10mm,
    gutter: 5mm,
    // align: left + horizon,
   [Points:  $underline(#h(4cm))$ / #totalpoints(cfg)],
   [Grade: $underline(#h(6cm))$],
  )
]

#outline()

#ex1.exercise(cfg)
#ex2.exercise(cfg)
