#set page(
  width: auto,
  height: auto,
  margin: (x: 0cm),
)
#table(
  columns: 2,
  stroke: none,
  align: center,
  [ Question Mode ], [ Solution Mode ], 
  [#rect(width: 8cm, stroke: 2pt+blue,
    image("../example/build/example_question_mode.svg", width: 8cm)
)],
  [#rect(width: 8cm, stroke: 2pt+green, 
    image("../example/build/example_solution_mode.svg", width: 8cm)
)]
)
