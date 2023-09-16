
#let default_config() = {
  let cfg = (
    sol: false,
    level: 1,
    utils: (
      lines: ( spacing: 10mm ),
      checkbox: (
        sym_true: "☒",
        sym_false: "☐",
        sym_question: "☐"
      )
    )
  )
  return cfg
}

#let checkbox(cfg, answer) = {
  if cfg.sol {
    if answer {
    cfg.utils.checkbox.sym_true
    } else {
    cfg.utils.checkbox.sym_false
    }
  } else {
    cfg.utils.checkbox.sym_question
  }
}

#let points(num) = {
  let c = state("points", 0.0)
  c.update(points => points + num)
  [ #num ]
}


#let totalpoints(outline:false) = {
  locate(loc => {
    let c = state("points", 0.0)
    let points = c.final(loc)
    if outline {
      points = points/2
    }
    [ #points ]
    }
  )
}

#let lines(count, cfg) = {
  let content = []
  for n in range(count) {
    content += [#v(cfg.utils.lines.spacing) #line(length:100%) ]
  }
  return content
}
