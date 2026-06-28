# General TCL Progamming Logics

# Table of Contents

- [Print Even Numbers (1-100)](#print-even-numbers-1-100)
- [Print Odd Numbers (1-100)](#print-odd-numbers-1-100)
- [Print Prime Numbers (2-100)](#print-prime-numbers-2-100)
- [Factorial Using Procedure](#factorial-using-procedure)
- [Fibonacci Series](#fibonacci-series)
- [Palindrome Check](#palindrome-check)
- [Print Numbers Divisible by 4 but Stop in 70s](#print-numbers-divisible-by-4-but-stop-in-70s)
- [Sum of Numbers 1 to 100](#sum-of-numbers-1-to-100)
- [Check Prime Number](#check-prime-number)
- [Largest of Three Numbers](#largest-of-three-numbers)
- [Swap Two Numbers](#swap-two-numbers)

## Print Even Numbers (1-100)

```tcl
for {set i 1} {$i <= 100} {incr i} {
    if {$i % 2 == 0} {
        puts $i
    }
}
```

## Print Odd Numbers (1-100)

```tcl
for {set i 1} {$i <= 100} {incr i} {
    if {$i % 2 != 0} {
        puts $i
    }
}
```

## Print Prime Numbers (2-100)

```tcl
for {set num 2} {$num <= 100} {incr num} {
    set prime 1
    for {set i 2} {$i < $num} {incr i} {
        if {$num % $i == 0} {
            set prime 0
            break
        }
    }
    if {$prime} {
        puts $num
    }
}
```

## Factorial Using Procedure

```tcl
proc factorial {n} {
    set fact 1
    for {set i 1} {$i <= $n} {incr i} {
        set fact [expr {$fact * $i}]
    }
    return $fact
}
puts [factorial 5]
```

## Fibonacci Series

```tcl
set a 0
set b 1
for {set i 1} {$i <= 10} {incr i} {
    puts $a
    set temp [expr {$a + $b}]
    set a $b
    set b $temp
}
```

## Palindrome Check

```tcl
if {$str eq [string reverse $str]} {
    puts "Palindrome"
}
```

## Print Numbers Divisible by 4 but Stop in 70s

```tcl
for {set i 1} {$i <= 100} {incr i} {
    if {$i >= 70 && $i < 80} {
        break
    }
    if {$i % 4 == 0} {
        puts $i
    }
}
```

## Sum of Numbers 1 to 100

```tcl
set sum 0
for {set i 1} {$i <= 100} {incr i} {
    incr sum $i
}
puts $sum
```

## Check Prime Number

```tcl
set num 37
set prime 1
for {set i 2} {$i < $num} {incr i} {
    if {$num % $i == 0} {
        set prime 0
        break
    }
}
puts $prime
```

## Largest of Three Numbers

```tcl
set a 10
set b 30
set c 20
set max $a
if {$b > $max} {set max $b}
if {$c > $max} {set max $c}
puts $max
```

## Swap Two Numbers

```tcl
set a 10
set b 20
set temp $a
set a $b
set b $temp
puts "$a $b"
```
