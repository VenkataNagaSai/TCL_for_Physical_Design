# File Handling

# Table of Contents

- [Count Number of Lines in a File](#count-number-of-lines-in-a-file)
- [Count Number of Words](#count-number-of-words)
- [Find Particular Pattern in File](#find-particular-pattern-in-file)
- [Remove Duplicate Lines](#remove-duplicate-lines)
- [Count Blank Lines](#count-blank-lines)
- [Count Occurrence of Word "slack"](#count-occurrence-of-word-slack)
- [Print Only VIOLATED Paths](#print-only-violated-paths)
- [Copy One File to Another](#copy-one-file-to-another)
- [Find Longest Line](#find-longest-line)

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

## Copy One File to Another

```tcl
set in [open in.txt r]
set out [open out.txt w]
while {[gets $in line] >= 0} {
    puts $out $line
}
close $in
close $out
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
