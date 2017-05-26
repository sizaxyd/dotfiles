#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto'
PS1='[\u@\h \W]\$ '

# for keychain autostart
# eval $(keychain --agents ssh,gpg --noask --nogui --eval --quiet ~/.ssh/keys --confhost ~/.ssh/config)

function switch_rcnit(){
    sudo rm -r /etc/systemd/network/20*
    sudo cp /home/harm/20-rcnit.network /etc/systemd/network/
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    echo -e "Switched to rcnit network settings."
}

function switch_off(){
    sudo rm -r /etc/systemd/network/*
    sudo cp /home/harm/25-wireless.network /etc/systemd/network/
    sudo cp /home/harm/20-wired.network /etc/systemd/network/
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    echo -e "Switched to common network settings."
}
