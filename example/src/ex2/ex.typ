#import "@local/tutor:0.3.0": points, lines 

#let exercise(cfg) = [
#heading(level:cfg.level, 
[FHIR vs HL7v2 (#points(4.5) points)])

List two differences between HL7v2 and FHIR:

+ #if cfg.sol { [ HL7v2 uses a non-standard line format, where as FHIR uses XML or JSON] } else { [ #lines(cfg,3) ] }
+ #if cfg.sol { [ FHIR specifies various resources that can be queried, where as HL7v2 has a number of fixed fields that are either filled in or not]} else { [ #lines(cfg,3) ] }
]
