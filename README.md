# tutor

Utilities to write exams and exercises with integrated solutions. Set the variable `sol=true` to display the solutions for a given exercise.

Currently the following features are supported:

* Automatic total point calculation through the `#points()` and `#totalpoints()` functions.
* Checkboxes that are either blank or show the solution state using eg. `#checkbox(sol, answer:true)`.
* Display blank lines for students to write their answer to using eg. `#lines(3)`.
* A proposition for a project structure allowing self-contained exercises and a mechanism to show or hide the solutions of an exercise.

## Usage

### Minimal Example

```typst
#import "@local/tutor:0.2.0": points, totalpoints, lines, checkbox

#let sol = false

// 3 lines to write an answer
#lines(3, spacing:8mm)
// checkbox for multiple choice (indicated correct state)
#checkbox(sol, answer:true)

Max. points: #points(2)
Max. points: #points(3)
Total points: #totalpoints() // will show 5
```

### Practical Example

Consider the following directory and file structure:

```
├── main.typ
└─── src
    ├── ex1
    │   └── ex.typ
    └── ex2
        ├── ex.typ
        └── HL7_FHIR.png
```

Every directory in `src` holds one self-contained exercise. The exercises can be imported into `main.typ`:

```typst
#import "@local/tutor:0.2.0": totalpoints, lines

#import "src/ex1/ex.typ" as ex1
#import "src/ex2/ex.typ" as ex2


#let sol = false

#text(16pt)[
  Name: $underline(#h(15cm))$
  #v(3mm)
  #grid(
    columns: (1fr, 1fr),
    rows: 10mm,
    gutter: 5mm,
   [Points:  $underline(#h(5cm))$ / #totalpoints()],
   [Grade: $underline(#h(6cm))$],
  )
]

#ex1.exercise(sol)
#ex2.exercise(sol)
```
Finally the exercies:

`src/ex1/ex.typ`
```
#import "@local/tutor:0.2.0": points, checkbox

#let exercise(sol, lvl:1, cfg:none) = [
#heading(level:lvl, [Abbreviation FHIR (#points(1) point)])

What does FHIR stand for?

#set list(marker: none)
- #checkbox(sol, false)  Finally He Is Real
- #checkbox(sol, true)   Fast Health Interoperability Resources
- #checkbox(sol, false)   First Health Inactivation Restriction

#if sol {
  [ Further explanation: FHIR is the new standard developed by HL7. ]
}
]
```

`src/ex2/ex.typ`
```
#import "@local/tutor:0.2.0": points, lines 

#let exercise(sol) = [
= FHIR vs HL7v2 (#points(4.5) points)

List two differences between HL7v2 and FHIR:

+ #if sol { [ HL7v2 uses a non-standard line format, where as FHIR uses XML or JSON] } else { [ #lines(3) ] }
+ #if sol { [ FHIR specifies various resources that can be queried, where as HL7v2 has a number of fixed fields that are either filled in or not]} else { [ #lines(3) ] }

#image("HL7_FHIR.png", width: 3cm)

]
```
