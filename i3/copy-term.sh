#!/bin/bash

pid=$(xprop -id $(xdotool getactivewindow) _NET_WM_PID | awk '{print $NF}') + 2
cwd=$(readlink /proc/$pid/cwd)

urxvt -cd $cwd
