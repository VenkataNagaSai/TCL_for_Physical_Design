# TCL for Physical Design

## Table of Contents

- [1. Tcl Introduction and Basics](#1-tcl-introduction-and-basics)
- [2. Operators](#2-operators)
  - [Arithmetic](#arithmetic)
  - [Comparison](#comparison)
  - [Logical](#logical)
  - [Bitwise](#bitwise)
  - [String operator](#string-operator)
- [3. Conditional Statement](#3-conditional-statement)
- [4. Loop](#4-loop)
  - [for](#for)
  - [while](#while)
  - [foreach](#foreach)
- [5. Loop Control](#5-loop-control)
- [6. String](#6-string)
- [7. List](#7-list)
- [8. Array](#8-array)
- [9. Dictionary](#9-dictionary)
- [10. Regular Expression](#10-regular-expression)
- [11. File Handling](#11-file-handling)
- [12. Procedure](#12-procedure)
- [13. Expression](#13-expression)
- [14. Useful Built in Math Functions](#14-useful-built-in-math-functions)
- [15. Formatting](#15-formatting)
- [16. Time Commands](#16-time-commands)
- [17. Information Commands](#17-information-commands)
- [18. Namespace Commands](#18-namespace-commands)
- [19. Error Handling](#19-error-handling)
- [20. Package Commands](#20-package-commands)
- [21. Report Parsing](#21-report-parsing)
- [22. Common Tcl Scripts in Physical Design](#22-common-tcl-scripts-in-physical-design)
- [23. Synopsys and Cadence Collection Commands](#23-synopsys-and-cadence-collection-commands)
- [24. Most Used Physical Design Commands](#24-most-used-physical-design-commands)
- [25. File Search Utilities](#25-file-search-utilities)
- [26. Linux Commands Used Inside Tcl](#26-linux-commands-used-inside-tcl)
- [27. Advanced Tcl](#27-advanced-tcl)
- [28. General Programs](#28-general-programs)
- [29. Physical Design Report Parsing Questions](#29-physical-design-report-parsing-questions)
- [30. Tool Specific Tcl Knowledge](#30-tool-specific-tcl-knowledge)
- [High Priority Topics for Physical Design](#high-priority-topics-for-physical-design)

## 1. Tcl Introduction and Basics

TCL is heavily used in many EDA tools like

* Cadence Genus
* Cadence Innovus
* Cadence Tempus
* Synopsys Design Compiler
* Synopsys ICC2
* Synopsys PrimeTime
* Synopsys Fusion Compiler

### Common applications

* Timing report parsing
* ECO automation
* Collection handling
* CTS automation
* Placement checks
* Routing checks
* Design sanity checks
* Batch automation

### TCL Basics

* Variables (`set`, `puts`, `unset`, `incr`)
* Data types
* Comments
* Quoting (`""`, `{}`, `[]`)
* Escape characters
* Expressions (`expr`)
* Operators
* Command substitution
* Variable substitution

### Variable Handling

Used for: Storing slack, utilization, cell names, file names, etc.

```tcl
set var 10
puts $var
unset var
incr var
```

### Command Substitution

```tcl
set count [llength $cells]
```

The command inside [ ] executes first.

#### Example

```tcl
set width 100
set height 200
puts "Area = [expr {$width*$height}]"
```

## 2. Operators

### Arithmetic

``` tcl
+
-
*
/
%
**
```
### Comparison

``` tcl
==
!=
>
<
>=
<=
```

### Logical

``` tcl
&&
||
!
```

### Bitwise

``` tcl
& 
|
^
~
<<
>>
```

### String operators

``` tcl
eq
ne
string compare
string equal
```

## 3. Conditional Statement

### if-elseif-else Statement

```tcl
if {} {}

if {} {
} elseif {} {
} else {
}
```

### Switch Statement

Syntax

``` tcl
switch $var {
"case1" {puts "print case1"} 
"case2" {puts "print case2"}
"case3" {puts "print case3"}
default {puts "default body"}
```

Switch Statement Example

``` tcl
set a "banana"
switch $a {
"apple" {puts "apple is present"}
"mango" {puts "mango is present"} 
"banana" {puts "banana is present"}
"default" {puts "no such fruit present"}
}
```

## 4. Loop

### for

```tcl
for {set i 0} {$i<10} {incr i} {
    puts $i
}
```

### while

```tcl
while {$i<100} {
    puts $i
}
```

### foreach

```tcl
foreach cell $cells {
    }
```

## 5. Loop Control

```tcl
break
continue
return
```
## 6. String

``` tcl
string length
string compare
string equal
string first
string last
string index
string range
string trim
string toupper
string tolower
string map
string match
```

### String PD Example

```tcl
string match "*DFF*" $cell
```

## 7. List

``` tcl
list
llength
lindex
linsert
lappend
lreplace
lrange
lsort
lsearch
join
split
concat
```

## 8. Array

```tcl
array set
array get
array names
array exists
array size
array unset
```

## 9. Dictionary

``` tcl
dict create
dict get
dict set
dict exists
dict keys
dict values
```

## 10. Regular Expression

```tcl
regexp
regsub
```
Very important for report parsing.

### RegExp Example

```tcl
regexp {slack\s+(-?\d+\.\d+)} $line
```
Gives slack

## 11. File Handling

```tcl
open
close
gets
puts
read
seek
tell
eof
glob
file exists 
file delete
file copy 
file rename
```
### File Handling Example

```tcl
set fp [open timing.rpt r]
while {[gets $fp line] >=0} {
    puts $line
}
close $fp
```

## 12. Procedure

```tcl
proc
return
global
upvar
uplevel
```

### Procedure Example

```tcl
proc area {w h} {
    return [expr {$w*$h}]
}
```

## 13. Expression

```tcl
expr
```

Always use

```tcl
expr {$a+$b}
```

## 14. Useful Built in Math Functions

```tcl
abs()
sqrt()
pow()
sin()
cos()
tan()
log()
log10()
exp()
round()
floor()
ceil()
rand()
srand()
int()
double()
hypot()
fmod()
```

## 15. Formatting

``` tcl
format
scan
binary
```

## 16. Time Commands

``` tcl
clock seconds
clock format
clock clicks
```

## 17. Information Commands

``` tcl
info commands
info vars
info exists
info globals
info locals
info body
info procs
```

## 18. Namespace Commands

``` tcl
namespace eval
namespace import
namespace export
```

## 19. Error Handling

``` tcl
catch
error
try
```

## 20. Package Commands

``` tcl
package require
package provide 
source
```
## 21. Report Parsing

### Examples:

* Parse timing reports
* Parse utilization reports
* Parse congestion reports
* Parse DRC reports
* Parse power reports
* Parse CTS reports
* Parse IR drop reports
* Parse EM reports

## 22. Common Tcl Scripts in Physical Design

* Find worst slack
* Count setup violations
* Count hold violations
* Count DRCs
* Count cells
* Count macros
* Find high fanout nets
* Find unplaced cells
* Find floating pins
* Parse CTS reports
* Parse congestion reports
* Parse utilization
* Parse clock skew
* Extract frequencies
* Parse PrimeTime reports
* Parse Innovus reports
* Parse ICC2 reports

## 23. Synopsys and Cadence Collection Commands

```tcl
sizeof_collection
foreach_in_collection
filter_collection
remove_from_collection
add_to_collection
index_collection
sort_collection
```

### Foreach in Collection Example

The main usecase of Foreach in Collection is to Iterate Collections.

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

### Size of Collection Example

To Count number of cells

```tcl
set count [sizeof_collection [get_cells *]]
puts $count
```

## 24. Most Used Physical Design Commands

```tcl
get_cells
get_pins
get_ports
get_nets
get_clocks
get_lib_cells
get_lib_pins
get_attribute
set_attribute
report_timing
report_constraints
report_qor
report_power
report_clock
report_area
all_fanout
all_connected
```
## Attribute PD Examples

```tcl
get_attribute $cell ref_name
get_attribute $cell area
```

## 25. File Search Utilities

``` tcl
glob file 
dirname file 
tail 
pwd 
cd 
exec
```

## 26. Linux Commands Used Inside Tcl

``` tcl
exec grep
exec awk
exec sed
exec sort
exec uniq
exec gzip
exec gunzip
exec wc
exec head
exec tail
```
### Exec PD Example

``` tcl
exec grep slack timing.rpt
```

## 27. Advanced Tcl

* Nested procedures
* Recursion
* Lambdas
* Eval
* Uplevel
* Upvar
* Variable scope
* Namespaces

## 28. General Programs

* Factorial
* Prime numbers
* Fibonacci
* Palindrome
* Armstrong number
* Reverse string
* Count words
* Count characters
* Count lines
* Duplicate removal
* Frequency counter
* Matrix multiplication
* Bubble sort
* Binary search
* File parser
* Report parser

## 29. Physical Design Report Parsing Questions

* Find Worst Negative Slack (WNS)
* Find Total Negative Slack (TNS)
* Count setup violations
* Count hold violations
* Find max transition
* Find max capacitance
* Find max fanout
* Find clock skew
* Find insertion delay
* Find latency
* Parse DRC summary
* Parse utilization percentage
* Parse congestion hotspots
* Find IR-drop violations
* Find EM violations

## 30. Tool Specific Tcl Knowledge

For Synopsys tools (ICC2, PrimeTime, Fusion Compiler):

* Collections (`foreach_in_collection`, `sizeof_collection`)
* `get_*` and `report_*` commands
* Attribute access (`get_attribute`, `set_attribute`)
* Constraint scripting (SDC)
* ECO automation scripts
* QoR report parsing

For Cadence tools (Innovus, Tempus):

* Database commands (`dbGet`, `dbSet`)
* Object queries
* Floorplan automation
* Placement and routing automation
* Timing and DRC report extraction

## High Priority Topics for Physical Design

1. Variables, expressions, and operators
2. Conditions and loops
3. Lists and arrays
4. Strings and regular expressions
5. File handling
6. Procedures
7. Report parsing (`regexp`, `split`, `lindex`)
8. Linux command integration (`exec`)
9. Synopsys collection commands (`foreach_in_collection`, `sizeof_collection`)
10. Tool commands (`get_cells`, `get_pins`, `get_nets`, `report_timing`, `get_attribute`)
11. Timing, DRC, and QoR automation scripts
12. Practical report-parsing and debugging exercises
