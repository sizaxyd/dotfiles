#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto'
PS1='[\u@\h \W]\$ '

# for keychain autostart
eval $(keychain --agents ssh,gpg --noask --nogui --eval --quiet ~/.ssh/keys --confhost ~/.ssh/config)
