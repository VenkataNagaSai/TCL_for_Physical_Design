# TCL Control Structure in PD

Used for: Timing checks, report filtering.

## Conditional Statement

### if, elseif, else

```tcl
if {$slack < 0} {
    puts "Violation"
} elseif {$slack == 0} {
    puts "Boundary"
} else {
    puts "Clean"
}
```

## Loop

### for Loop

```tcl
for {set i 1} {$i <= 10} {incr i} {
    puts $i
}
```

### while Loop

```tcl
while {$count > 0} {
    incr count -1
}
```

### foreach Loop 

Most Important as it is used extensively in PD scripts.

```tcl
foreach cell $cell_list {
    puts $cell
}
```

Instead of simple we mainly use foreach_in_collection loop.

The main usecase of Foreach in Collection is to Iterate Collections.

#### Foreach in Collection Example

```tcl
set cells [get_cells *]
foreach_in_collection c $cells {
    puts [get_object_name $c]
}
```
Another way to represent Foreach in Collection 

```tcl
foreach_in_collection cell [get_cells *] {
    puts $cell
}
```

### Filter Collection Example

Filtering Sequential Cells

```tcl
foreach_in_collection cell [get_cells -filter "is_sequential==true"] {
    puts [get_object_name $cell]
}
```

#### High Fanout Nets

```tcl
foreach_in_collection net [get_nets *] {
    set fanout [sizeof_collection [all_fanout -flat -from $net]]
    if {$fanout > 100} {
        puts [get_object_name $net]
    }
}
```

### Floating Nets

```tcl
foreach_in_collection net [get_nets *] {
    if {[sizeof_collection [all_connected $net]] < 2} {
        puts [get_object_name $net]
    }
}
```

### Unconnected Ports

```tcl
foreach_in_collection port [get_ports *] {
    if {[sizeof_collection [all_connected $port]] == 0} {
        puts [get_object_name $port]
    }
}
```

## Procedure (Function)

Used to build reusable utilities.

```tcl
proc add {a b} {
    return [expr {$a + $b}]
}

puts [add 10 20]
```


