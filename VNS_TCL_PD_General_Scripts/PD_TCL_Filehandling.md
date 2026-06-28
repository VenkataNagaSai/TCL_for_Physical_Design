# PD TCL Filehandling

# Table of Contents

## Open a File

```tcl
set fp [open report.rpt r]
```

## Read lines in a File
```tcl
while {[gets $fp line] >= 0} {
    puts $line
}
```

## Close a File

```tcl
close $fp
```

## Read a complete File

```tcl
set fp [open report.rpt r]

while {[gets $fp line] >= 0} {
    puts $line
}

close $fp
```

## Copy a complete File

```tcl
set in [open input.txt r]
set out [open output.txt w]

while {[gets $in line] >= 0} {
    puts $out $line
}

close $in
close $out
```
## Count Number of Lines in a File

```tcl
set fp [open input.txt r]
set count 0
while {[gets $fp line] >= 0} {
    incr count
}
close $fp
puts "Lines = $count"
```

## Count Number of Words

```tcl
set fp [open input.txt r]
set words 0
while {[gets $fp line] >= 0} {
    incr words [llength $line]
}
close $fp
puts $words
```

## Find Particular Pattern in File

```tcl
while {[gets $fp line] >= 0} {
    if {[regexp {VIOLATED} $line]} {
        puts $line
    }
}
```

## Remove Duplicate Lines

```tcl
array set seen {}
while {[gets $fp line] >= 0} {
    if {![info exists seen($line)]} {
        puts $line
        set seen($line) 1
    }
}
```

## Count Blank Lines

```tcl
set count 0
while {[gets $fp line] >= 0} {
    if {[string trim $line] eq ""} {
        incr count
    }
}
```

## Count Occurrence of Word "slack"

```tcl
set count 0
while {[gets $fp line] >= 0} {
    if {[regexp {slack} $line]} {
        incr count
    }
}
```

## Print Only VIOLATED Paths

```tcl
while {[gets $fp line] >= 0} {
    if {[regexp {VIOLATED} $line]} {
        puts $line
    }
}
```

## Find Longest Line

```tcl
set maxlen 0
while {[gets $fp line] >= 0} {
    if {[string length $line] > $maxlen} {
        set maxlen [string length $line]
    }
}
puts $maxlen
```
