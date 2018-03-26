#!/usr/bin/env bash

rustup_update() {
    echo "rust update"
    rustup update
}

alacritty_update() {
    echo "alacritty update"
    cd ~/alacritty/
    git pull
}

emacs_update() {
    echo "spacemacs update"
    cd ~/.emacs.d/
    git pull
}

remacs() {
    echo "remacs"
    cd ~/remacs/
    git pull
}

sudo pacman -Syu --noconfirm
alacritty_update
emacs_update
rustup_update
