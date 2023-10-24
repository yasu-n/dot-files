#!/usr/bin/env fish

# get volume
set volume_text (wpctl get-volume @DEFAULT_AUDIO_SINK@)
set volume (echo $volume_text | awk '{printf "%s\n", $2*100}')
set mute_status (echo $volume_text | awk '{printf $3}')
if test "$mute_status" != ""
    set volume 0
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

# battery charge
set battery_device (upower -e | grep battery_BAT0)
set battery_state (upower -i $battery_device | grep state | grep charging)
set icon_charge ""
if test battery_state != ""
    set icon_charge ""
end

# output volume text
set text ""
if test $volume -eq 0
    set text "mute  $icon_charge "
else
    set text "$volume% $icon_charge $icon_bt"
end

echo '{"text": "'$text'", "tooltip": "'$device_name'"}'
