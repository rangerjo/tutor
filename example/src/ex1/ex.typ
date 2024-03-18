#import "@local/tutor:0.4.0": points, checkbox

#let exercise(cfg) = [
#heading(level:cfg.level, 
[Abbreviation FHIR (#points(1) point)])

What does FHIR stand for?

#set list(marker: none)
- #checkbox(cfg, false)  Finally He Is Real
- #checkbox(cfg, true)   Fast Health Interoperability Resources
- #checkbox(cfg, false)   First Health Inactivation Restriction

#if cfg.sol {
  [ Further explanation: FHIR is the new standard developed by HL7. ]
}
]
