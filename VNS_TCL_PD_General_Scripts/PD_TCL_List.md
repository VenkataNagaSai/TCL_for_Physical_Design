# PD TCL List

# Table of Contents

## List Creation

```tcl
set cells {U1 U2 U3}
```

## List Length

```tcl
llength $cells
```

## List Access Element

```tcl
lindex $cells 0
```

## List Append

```tcl
lappend cells U4
```

## List Search

```tcl
lsearch $cells U2
```

## List Sort

```tcl
lsort $cells
``` 

## Sort Integers or Numbers in a List

```tcl
set nums {50 20 10 40 30}
puts [lsort -integer $nums]
```

## Find Maximum Number in a List

```tcl
set nums {5 8 2 20 1}
set max [lindex $nums 0]
foreach n $nums {
    if {$n > $max} {
        set max $n
    }
}
puts $max
```

## Count Occurrences in a List

```tcl
array set count {}
foreach item {A B A C B A} {
    incr count($item)
}
parray count
```

## Remove Duplicates in a List

```tcl
set list {A B A C D B}
puts [lsort -unique $list]
```

## Second Largest Number in a List

```tcl
set nums {5 20 15 30 10}
set sorted [lsort -integer $nums]
puts [lindex $sorted end-1]
```

## Reverse a List

```tcl
set list {1 2 3 4 5}
puts [lreverse $list]
```

## Find Common Elements in a List

```tcl
set list1 {A B C D}
set list2 {C D E F}
foreach item $list1 {
    if {[lsearch $list2 $item] != -1} {
        puts $item
    }
}
```
