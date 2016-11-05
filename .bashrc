#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'
PS1='[\u@\h \W]\$ '

# for keychain autostart
eval $(keychain --noask --nogui --eval --quiet ~/.ssh/keys --confhost ~/.ssh/config)
