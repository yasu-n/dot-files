#!/usr/bin/env fish

# get volume
set volume_text (wpctl get-volume @DEFAULT_AUDIO_SINK@)
set volume (echo $volume_text | awk '{printf "%s\n", $2*100}')
set mute_status (echo $volume_text | awk '{printf $3}')
if test "$mute_status" != ""
    set volume 0
end

# output volume icon
set icon = ""
if test $volume -eq 0
    set icon ""
else if test $volume -gt 80
    set icon ""
else if test $volume -gt 30
    set icon ""
end

# set bluetooth device id
set device_id (wpctl inspect @DEFAULT_AUDIO_SINK@ | \
    grep device.id | \
    sed 's/* device.id = //' | \
    xargs -I {} fish -c 'printf "%d" "{}"')

# device name
set device_name (wpctl inspect $device_id | \
    grep device.description | \
    sed 's/* device.description = //' | \
    xargs -I {} fish -c 'printf "%s" "{}"')

# bluetooth or not
set device_bus (wpctl inspect $device_id | \
    grep device.bus | \
    grep bluetooth)

# bluetooth icon
set icon_bt ""
if test "$device_bus" != ""
    set icon_bt ""
end

set text ""
if test $volume -eq 0
    set text "mute $icon "
else
    set text "$volume% $icon $icon_bt"
end

echo '{"text": "'$text'", "tooltip": "'$device_name'"}'
