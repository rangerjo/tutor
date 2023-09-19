# tutor

Utilities to write exams and exercises with integrated solutions. Set the variable `sol=true` to display the solutions of a document.

Currently the following features are supported:

* Automatic total point calculation through the `#points()` and `#totalpoints()` functions.
* Checkboxes that are either blank or show the solution state using eg. `#checkbox(sol, answer:true)`.
* Display blank lines for students to write their answer to using eg. `#lines(3)`.
* A proposition for a project structure allowing self-contained exercises and a mechanism to show or hide the solutions of an exercise.

## Usage

### Minimal Example

```typst
#import "@local/tutor:0.2.0": points, totalpoints, lines, checkbox

#let cfg = default_config()
// enable solution mode
#(cfg.sol = true)

// display 3 lines (for hand written answer)
#lines(cfg, 3)
// checkbox for multiple choice (indicates correct state)
#checkbox(cfg, true)

// show achievable points
Max. points: #points(2)
Max. points: #points(3)
// show sum of all total achievable points (will show 5)
Total points: #totalpoints(cfg)
```

### Practical Example

Check [example](./example) for a more practical example.

`tutor` is best used with the following directory and file structure:

```
├── main.typ
├── src
│   ├── ex1
│   │   └── ex.typ
│   └── ex2
│       └── ex.typ
└── tutor.toml
```

Every directory in `src` holds one self-contained exercise. The exercises can be imported into `main.typ`:

```typst
#import "@local/tutor:0.2.0": totalpoints, lines

#import "src/ex1/ex.typ" as ex1
#import "src/ex2/ex.typ" as ex2


#let cfg = default_config()
#ex1.exercise(cfg)
#ex2.exercise(cfg)
```
Supporting self-contained exercises is one of `tutor`s primary design goals. Each exercise lives within a folder and can easily be copied or referenced in a new document.

An exercise is a folder that contains an `ex.typ` file along with any other assets (images, source code aso). The following exercise shows a practical usage of the `#checkbox()` and `#points()` functions.

`src/ex1/ex.typ`
```
#import "@local/tutor:0.3.0": points, checkbox

#let exercise(cfg) = [
#heading(level:cfg.lvl, [Abbreviation FHIR (#points(1) point)])

What does FHIR stand for?

#set list(marker: none)
- #checkbox(cfg, false)  Finally He Is Real
- #checkbox(cfg, true)   Fast Health Interoperability Resources
- #checkbox(cfg, false)   First Health Inactivation Restriction

#if cfg.sol {
  [ Further explanation: FHIR is the new standard developed by HL7. ]
}
]
```

Finally this second example shows the `#lines()` function.
`src/ex2/ex.typ`
```
#import "@local/tutor:0.3.0": points, lines 

#let exercise(cfg) = [
#heading(level:cfg.lvl, [FHIR vs HL7v2 (#points(4.5) points)])

List two differences between HL7v2 and FHIR:

+ #if cfg.sol { [ HL7v2 uses a non-standard line format, where as FHIR uses XML or JSON] } else { [ #lines(cfg, 3) ] }
+ #if cfg.sol { [ FHIR specifies various resources that can be queried, where as HL7v2 has a number of fixed fields that are either filled in or not]} else { [ #lines(cfg, 3) ] }
]
```

This would then give the following output in question mode (`#(cfg.sol=false)`)
![Example document in question mode](imgs/example_question_mode.png)
and in solution mode (`#(cfg.sol=true)`):
![Example document in solution mode](imgs/example_solution_mode.png)

## Configuration

`tutor` is designed to create exams and solutions with one single document source. Furthermore, the individual utilities provided by `tutor` can be configured. This can be done in either of two ways:

1. Use the `#default_config()` function and patch your configuration. The following example would configure the solution mode and basic line spacings to 8 millimeters:

```
#let cfg = default_config()
#(cfg.sol = false)
#(cfg.utils.lines.spacing = 8mm)
```

2. Use an external file to hold the configurations in your prefered format. See [tutor.toml](./example/tutor.toml) for a configuration in TOML. This could then easily be integrated using
```
#let cfg = toml("tutor.toml")
```
