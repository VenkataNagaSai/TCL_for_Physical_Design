# TCL RegExp and Report Parsing in PD

Used to extract slack, WNS, TNS, cell names from PD reports.

## Extract Slack

```tcl
regexp {slack.*(-?\d+\.\d+)} $line match slack
```

## Extract WNS

```tcl
regexp {WNS:\s*(-?\d+\.\d+)} $line match wns
```

## Extract TNS

```tcl
regexp {TNS:\s*(-?\d+\.\d+)} $line match tns
```

## Extract Startpoint

```tcl
regexp {Startpoint:\s+(\S+)} $line match start
```

## Extract Endpoint

```tcl
regexp {Endpoint:\s+(\S+)} $line match end
```

## Find and Count Violations

```tcl
if {[regexp {VIOLATED} $line]} {
    puts $line
    incr count
}
```
