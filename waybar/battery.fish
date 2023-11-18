#!/usr/bin/env fish

# battery charge
set device (upower -e | grep battery_BAT0)
set state (upower -i $device | grep state | grep -v discharging)
set percentage (upower -i $device | \
    grep percentage | \
    sed 's/ *percentage: * //' | \
    sed 's/%//')

set empty (upower -i $device | \
    grep "time to empty" | \
    awk '{printf $4}' | \
    sed 's/[\.]/ h /')
#set empty (upower -i $device | \
#    grep "time to empty" | \
#    sed 's/ *time to empty: * //')

set icon ""
if test $percentage -gt 90
    set icon ""
else if test $percentage -gt 70
    set icon ""
else if test $percentage -gt 40
    set icon ""
else if tet $percentage -gt 10
    set icon ""
else 
    set icon ""
end

if test "$state" != ""
    set icon ""
end

set text "$icon  $percentage%"
set tooltip "Time to empty: $empty min"

echo '{"text": "'$text'", "tooltip": "'$tooltip'"}'
