# PD TCL ECO Automation

## Generate TCL ECO

```tcl
set fp [open eco.tcl w]
puts $fp "size_cell U123 BUF_X4"
close $fp
```

## Generate Buffer ECO

```tcl
set fp [open eco_buf.tcl w]
foreach_in_collection net [get_nets *] {
    set fanout [sizeof_collection [all_fanout -flat -from $net]]
    if {$fanout > 50} {
        puts $fp "insert_buffer [get_object_name $net]"
    }
}
close $fp
```
