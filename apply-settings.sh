#!/bin/sh
# This script calls all the scripts that need to be called and creates
# the symlinks.

# Add minimize and maximize buttons to windows
gsettings set org.gnome.desktop.wm.preferences button-layout 'icon:minimize,maximize,close'
# Make the text bigger in Gnome and Firefox
gsettings set org.gnome.desktop.interface text-scaling-factor 1.5
# Disable natural scrolling
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

# Set up gnome extensions
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable arcmenu@arcmenu.com
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
gnome-extensions enable tiling-assistant@leleat-on-github
# FIXME: Applying the dconf-settings didn't work. The dash-to-panel extension isn't
# configured the way I want it. The following is not working
#  - The launcher icons are not the ones I configured
#   - Files, Firefox, Terminal, Steam, Discord, Signal
#  - The height of the panel is not 32
#  - The date and time is not to the far right
#  - The show desktop button to the far right is still showing
#  - The Show Apps icon on the far left is still showing
#
#  Maybe I need to submit patches to make each setting a value instead of a JSON string?
# TODO: Change to gsettings since dconf doesn't do type checking
~/.dotfiles/apply-dconf-settings.sh

# TODO: Restore my Gnome background image
# TODO: Restore mouse bluetooth pairing
# TODO: Restore Gnome dark theme?
# TODO: Turn Gnome Night Light on
# TODO: Set Alert Sound in Gnome Sound settings to None 
# TODO: Set up Firefox extensions:
#  - Ublock origin extension
#  - BitWarden extension
#  - Dark Reader
#  - Gmail notifier
# TODO: Set up Firefox settings:
#  - Nixos package search provider
#  - Use my panel layout
#  - Hide pocket button
#  - Don't show sponsored shortcuts
#  - Add my links to shortcuts
#  - Set Shortcuts to 2 rows
#  - Open previous windows and tabs on startup
#  - Turn off Picture-in-Picture video controls
#  - Don't ask to save passwords
#  - Don't save and fill payment methods
#  - Disable Send techincal and interaction data to Mozilla
#  - Disable Send daily usage ping to Mozilla
# TODO: Restore Steam games from backup. First I need to force proton or it would
#       give me the invalid platform error message. I got another error after that and
#       then it downloaded Satisfactory instead.

rm ~/.gitconfig
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitmessage.txt ~/.gitmessage.txt

rm ~/.bash_profile
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile

mkdir -p ~/.local/bin
ln -s ~/.dotfiles/bin/nixos-switch ~/.local/bin/nixos-switch
ln -s ~/.dotfiles/bin/gh-update-main ~/.local/bin/gh-update-main
ln -s ~/.dotfiles/bin/gh-update-master ~/.local/bin/gh-update-master
