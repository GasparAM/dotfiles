#!/bin/sh
xrandr --output DVI-I-0 --primary --mode 1600x900 --pos 1280x0 --rotate normal --output DVI-I-1 --off --output HDMI-0 --off --output DP-0 --off --output DP-1 --off --output VGA-1-1 --mode 1280x1024 --pos 0x0 --rotate normal;
picom --experimental-backends
