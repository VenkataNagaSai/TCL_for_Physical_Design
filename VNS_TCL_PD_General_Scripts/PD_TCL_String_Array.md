# PD TCL String

Used for report parsing and object filtering.

```tcl
string length $name
string compare $a $b
string match *CLK* $pin
string first CLK $pin
```
## PD String Example

```tcl
if {[string match *clk* $pin]} {
    puts "Clock pin"
}
```

# PD TCL Array

Also specified as Associative Arrays, used for storing timing data.

## PD Array Example

```tcl
array set slack {
    path1 -0.10
    path2 0.05
}

puts $slack(path1)
```
