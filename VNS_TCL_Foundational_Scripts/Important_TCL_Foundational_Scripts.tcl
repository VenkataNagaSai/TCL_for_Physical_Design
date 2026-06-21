# Important TCL Foundational Scripts

# Tier-1: Programming Logic

# ---------------------------------------------
# Print Even Numbers (1-100)
# ---------------------------------------------

for {set i 1} {$i <= 100} {incr i} {
    if {$i % 2 == 0} {
        puts $i
    }
}

# ---------------------------------------------
# Print Odd Numbers (1-100)
# ---------------------------------------------

for {set i 1} {$i <= 100} {incr i} {
    if {$i % 2 != 0} {
        puts $i
    }
}

# ---------------------------------------------
# Print Prime Numbers (2-100)
# ---------------------------------------------

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

# ---------------------------------------------
# Factorial Using Procedure
# ---------------------------------------------

proc factorial {n} {
    set fact 1
    for {set i 1} {$i <= $n} {incr i} {
        set fact [expr {$fact * $i}]
    }
    return $fact
}
puts [factorial 5]

# ---------------------------------------------
# Fibonacci Series
# ---------------------------------------------

set a 0
set b 1
for {set i 1} {$i <= 10} {incr i} {
    puts $a
    set temp [expr {$a + $b}]
    set a $b
    set b $temp
}

# ---------------------------------------------
# Palindrome Check
# ---------------------------------------------

if {$str eq [string reverse $str]} {
    puts "Palindrome"
}

# ---------------------------------------------
# Print Numbers Divisible by 4 but Stop in 70s
# ---------------------------------------------

for {set i 1} {$i <= 100} {incr i} {
    if {$i >= 70 && $i < 80} {
        break
    }
    if {$i % 4 == 0} {
        puts $i
    }
}

# ---------------------------------------------
# Sum of Numbers 1 to 100
# ---------------------------------------------

set sum 0
for {set i 1} {$i <= 100} {incr i} {
    incr sum $i
}
puts $sum

# ---------------------------------------------
# Check Prime Number
# ---------------------------------------------

set num 37
set prime 1
for {set i 2} {$i < $num} {incr i} {
    if {$num % $i == 0} {
        set prime 0
        break
    }
}
puts $prime

# ---------------------------------------------
# Largest of Three Numbers
# ---------------------------------------------

set a 10
set b 30
set c 20
set max $a
if {$b > $max} {set max $b}
if {$c > $max} {set max $c}
puts $max

# ---------------------------------------------
# Swap Two Numbers
# ---------------------------------------------

set a 10
set b 20
set temp $a
set a $b
set b $temp
puts "$a $b"

## Tier-2: File Handling

# ---------------------------------------------
# Count Number of Lines in a File
# ---------------------------------------------

set fp [open input.txt r]
set count 0
while {[gets $fp line] >= 0} {
    incr count
}
close $fp
puts "Lines = $count"

# ---------------------------------------------
# Count Number of Words
# ---------------------------------------------

set fp [open input.txt r]
set words 0
while {[gets $fp line] >= 0} {
    incr words [llength $line]
}
close $fp
puts $words

# ---------------------------------------------
# Find Particular Pattern in File
# ---------------------------------------------

while {[gets $fp line] >= 0} {
    if {[regexp {VIOLATED} $line]} {
        puts $line
    }
}

# ---------------------------------------------
# Remove Duplicate Lines
# ---------------------------------------------

array set seen {}
while {[gets $fp line] >= 0} {
    if {![info exists seen($line)]} {
        puts $line
        set seen($line) 1
    }
}

# ---------------------------------------------
# Count Blank Lines
# ---------------------------------------------

set count 0
while {[gets $fp line] >= 0} {
    if {[string trim $line] eq ""} {
        incr count
    }
}

# ---------------------------------------------
# Count Occurrence of Word "slack"
# ---------------------------------------------

set count 0
while {[gets $fp line] >= 0} {
    if {[regexp {slack} $line]} {
        incr count
    }
}

# ---------------------------------------------
# Print Only VIOLATED Paths
# ---------------------------------------------

while {[gets $fp line] >= 0} {
    if {[regexp {VIOLATED} $line]} {
        puts $line
    }
}

# ---------------------------------------------
# Copy One File to Another
# ---------------------------------------------

set in [open in.txt r]
set out [open out.txt w]
while {[gets $in line] >= 0} {
    puts $out $line
}
close $in
close $out

# ---------------------------------------------
# Find Longest Line
# ---------------------------------------------

set maxlen 0
while {[gets $fp line] >= 0} {
    if {[string length $line] > $maxlen} {
        set maxlen [string length $line]
    }
}
puts $maxlen

## Tier-3: Lists and Arrays

# ---------------------------------------------
# Sort Numbers in a List
# ---------------------------------------------

set nums {50 20 10 40 30}
puts [lsort -integer $nums]

# ---------------------------------------------
# Find Maximum Number in a List
# ---------------------------------------------

set nums {5 8 2 20 1}
set max [lindex $nums 0]
foreach n $nums {
    if {$n > $max} {
        set max $n
    }
}
puts $max

# ---------------------------------------------
# Count Occurrences in a List
# ---------------------------------------------

array set count {}
foreach item {A B A C B A} {
    incr count($item)
}
parray count

# ---------------------------------------------
# Remove Duplicates in a List
# ---------------------------------------------

set list {A B A C D B}
puts [lsort -unique $list]

# ---------------------------------------------
# Second Largest Number in a List
# ---------------------------------------------

set nums {5 20 15 30 10}
set sorted [lsort -integer $nums]
puts [lindex $sorted end-1]

# ---------------------------------------------
# Reverse a List
# ---------------------------------------------

set list {1 2 3 4 5}
puts [lreverse $list]

# ---------------------------------------------
# Find Common Elements in a List
# ---------------------------------------------

set list1 {A B C D}
set list2 {C D E F}
foreach item $list1 {
    if {[lsearch $list2 $item] != -1} {
        puts $item
    }
}




