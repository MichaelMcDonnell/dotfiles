#!/bin/sh
# This script calls all the scripts that need to be called and creates
# the symlinks.

~/.dotfiles/apply-dconf-settings.sh

rm ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
