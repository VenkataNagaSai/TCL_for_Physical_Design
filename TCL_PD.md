# TCL for Physical Design

## Table of Contents

- [Tcl Introduction](#tcl-introduction)
- [Operators](#operators)
- [Conditional Statement](#conditional-statement)
- [Loop](#loop)
- [Loop Control](#loop-control)
- [String](#string)
- [List](#list)
- [Array](#array)
- [Dictionary](#dictionary)
- [Regular Expression](#regular-expression)
- [File Handling](#file-handling)
- [Procedure](#procedure)
- [Expression](#expression)
- [Useful Built in Math Functions](#useful-built-in-math-functions)
- [Formatting](#formatting)
- [Time Commands](#time-commands)
- [Information Commands](#information-commands)
- [Namespace Commands](#namespace-commands)
- [Error Handling](#error-handling)
- [Package Commands](#package-commands)
- [Report Parsing](#report-parsing)
- [Common Tcl Scripts in Physical Design](#common-tcl-scripts-in-physical-design)
- [Synopsys and Cadence Collection Commands](#synopsys-and-cadence-collection-commands)
- [Most Used Physical Design Commands](#most-used-physical-design-commands)
- [Attribute PD Examples](#attribute-pd-examples)
- [File Search Utilities](#file-search-utilities)
- [Linux Commands Used Inside Tcl](#linux-commands-used-inside-tcl)
- [Advanced Tcl](#advanced-tcl)
- [General Programs](#general-programs)
- [Physical Design Report Parsing Questions](#physical-design-report-parsing-questions)
- [Tool Specific Tcl Knowledge](#tool-specific-tcl-knowledge)
- [Very useful TCL Topics for Physical Design](#very-useful-tcl-topics-for-physical-design)

## Tcl Introduction

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Operators

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Conditional Statement

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Loop

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

## Loop Control

```tcl
break
continue
return
```

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## String

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

## List

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Array

```tcl
array set
array get
array names
array exists
array size
array unset
```

## Dictionary

``` tcl
dict create
dict get
dict set
dict exists
dict keys
dict values
```

## Regular Expression

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## File Handling

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Procedure

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

## Expression

```tcl
expr
```

Always use

```tcl
expr {$a+$b}
```

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Useful Built in Math Functions

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

## Formatting

``` tcl
format
scan
binary
```

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Time Commands

``` tcl
clock seconds
clock format
clock clicks
```

## Information Commands

``` tcl
info commands
info vars
info exists
info globals
info locals
info body
info procs
```

## Namespace Commands

``` tcl
namespace eval
namespace import
namespace export
```

## Error Handling

``` tcl
catch
error
try
```
⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Package Commands

``` tcl
package require
package provide 
source
```

## Report Parsing

### Examples:

* Parse timing reports
* Parse utilization reports
* Parse congestion reports
* Parse DRC reports
* Parse power reports
* Parse CTS reports
* Parse IR drop reports
* Parse EM reports

## Common Tcl Scripts in Physical Design

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Synopsys and Cadence Collection Commands

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Most Used Physical Design Commands

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

## File Search Utilities

``` tcl
glob file 
dirname file 
tail 
pwd 
cd 
exec
```

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Linux Commands Used Inside Tcl

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

## Advanced Tcl

* Nested procedures
* Recursion
* Lambdas
* Eval
* Uplevel
* Upvar
* Variable scope
* Namespaces

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## General Programs

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

## Physical Design Report Parsing Questions

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)

## Tool Specific Tcl Knowledge

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

## Very useful TCL Topics for Physical Design

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

⬆️ **Back to Top:** [Table of Contents](#table-of-contents)
