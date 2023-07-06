
#let checkbox(show_sol, answer) = {
  if show_sol and answer {
    [☒]
  } else {
    [☐]
  }
}

#let points(num) = {
  let c = counter("points")
  c.update(points => points + num)
  [ #num ]
}


#let totalpoints(outline:false) = {
  locate(loc => {
    let c = counter("points")
    let points = c.final(loc).at(0)
    if outline {
      points = points/2
    }
    [ #points ]
    }
  )
}

#let lines(number, spacing: 10mm) = {
  let content = []
  for n in range(number) {
    content += [#v(spacing) #line(length:100%) ]
  }
  return content
}
