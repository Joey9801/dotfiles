#!/bin/bash
scrot /tmp/locked.png
convert /tmp/locked.png -scale 5% -scale 2000% /tmp/locked2.png
i3lock -i /tmp/locked2.png
