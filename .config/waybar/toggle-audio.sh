#!/bin/bash

current_sink=$(pactl get-default-sink)

sinks=($(pactl list short sinks | cut -f2))

headphones_sink="alsa_output.usb-HP__Inc_HyperX_Cloud_Alpha_Wireless_00000001-00.analog-stereo"
speakers_sink="alsa_output.usb-SteelSeries_SteelSeries_Arena_7-00.analog-stereo"

if [[ "$current_sink" == "$headphones_sink" ]]; then
    pactl set-default-sink "$speakers_sink"
    notify-send "Audio Output" "Switched to Speakers 󰓃"
else
    pactl set-default-sink "$headphones_sink"
    notify-send "Audio Output" "Switched to Headphones "
fi

new_sink=$(pactl get-default-sink)
for input in $(pactl list short sink-inputs | cut -f1); do
    pactl move-sink-input "$input" "$new_sink"
done

