## Control Structure

### Conditional Statement

#### if, elseif, else
```tcl
```

### Loop

#### for Loop

```tcl
for {set i 1} {$i <= 10} {incr i} {
    puts $i
}
```

#### while Loop

```tcl
while {$count > 0} {
    incr count -1
}
```

#### foreach Loop 


```tcl
```
## Procedure (Function)

Used to build reusable utilities.

```tcl
proc add {a b} {
    return [expr {$a + $b}]
}

puts [add 10 20]
```

