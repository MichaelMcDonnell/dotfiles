#!/bin/sh

# Make the text bigger in Gnome and Firefox
dconf write /org/gnome/desktop/interface/text-scaling-factor 1.5

# dash-to-panel
dconf load /org/gnome/shell/extensions/dash-to-panel/ < dash-to-panel.dconf
