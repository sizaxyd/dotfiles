#!/usr/bin/env bash

rustup_update() {
    echo "rust update"
    rustup update
}

alacritty_update() {
    echo "alacritty update"
    cd ~/alacritty/ || exit
    git pull
}

emacs_update() {
    echo "spacemacs update"
    cd ~/.emacs.d/ || exit
    git pull
}

remacs() {
    echo "remacs"
    cd ~/remacs/ || exit
    git pull
}

sudo pacman -Syu --noconfirm
emacs_update
#alacritty_update
#rustup_update
