# TCL String in PD

Used for report parsing and object filtering.

```tcl
string length $name
string compare $a $b
string match *CLK* $pin
string first CLK $pin
```
## String PD Example

```tcl
if {[string match *clk* $pin]} {
    puts "Clock pin"
}
```

# TCL Array in PD

Also specified as Associative Arrays, used for storing timing data.

## Array PD Example

```tcl
array set slack {
    path1 -0.10
    path2 0.05
}

puts $slack(path1)
```
