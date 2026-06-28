# PD TCL Operator

Used for Area calculations, percentages, coordinates.

## Arithmetic Operator

| Operator | Description    | Example |
| -------- | -------------- | ------- |
| +        | Addition       | expr {$a + $b} |
| -        | Subtraction    | expr {$a - $b} |
| *        | Multiplication | expr {$a * $b} |
| /        | Division       | expr {$a / $b} |
| %        | Modulus        | expr {$a % 2}  |
| **       | Power          | expr {$a ** 2} |

```tcl
set width 10
set height 20

set area [expr {$width * $height}]
puts $area
```

## Relational Operator

Used in if, while, and filtering conditions.

| Operator | Description           |
| -------- | --------------------- |
| ==       | Equal                 |
| !=       | Not Equal             |
| >        | Greater Than          |
| <        | Less Than             |
| >=       | Greater Than or Equal |
| <=       | Less Than or Equal    |

```tcl
if {$slack < 0} {
    puts "Timing violation"
}
```

## Logical Operator

| Operator | Description |
| -------- | ----------- |
| &&       | AND         |
| \|\|     | OR          |
| !        | NOT         |

```tcl
if {$setup_slack < 0 && $hold_slack < 0} {
    puts "Both setup and hold violations exist"
}
```

## String Comparision Operator

| Operator | Description |
| -------- | ----------- |
| eq       | String Equal|
| ne       | String Not Equal   |

```tcl
if {$cell_type eq "BUF"} {
    puts "Buffer found"
}
```
Preferred Over:

```tcl
if {$cell_type == "BUF"} ;# Avoid
```

## Membership Operator

### in

```tcl
if {$pin_name in {"clk" "rst" "scan_en"}} {
    puts "Special pin"
}
```
### ni

```tcl
if {$pin_name ni {"clk" "rst"}} {
    puts "Normal pin"
}
```

## Ternary Operator

Useful for compact conditions.

```tcl
set result [expr {$slack >= 0 ? "CLEAN" : "VIOLATION"}]
```
