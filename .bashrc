#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# only uniqe history
export HISTCONTROL=ignoreboth:erasedups
HISTSIZE=
HISTFILESIZE=

alias ls='ls -lah --color=auto'
PS1='[\u@\h \W]\$ '

function switch_cctv(){
    sudo rm -r /etc/systemd/network/enp.network
    sudo rm -r /etc/systemd/network/wlp.network
    sudo cp /home/harm/20-cctv.network /etc/systemd/network/enp.network
    sudo cp /home/harm/25-wifi-cctv.network /etc/systemd/network/wlp.network
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    echo -e "Switched to cctv network settings."
}

function switch_fast(){
    sudo rm -r /etc/systemd/network/enp.network
    sudo rm -r /etc/systemd/network/wlp.network
    sudo cp /home/harm/20-fast.network /etc/systemd/network/enp.network
    sudo cp /home/harm/25-wifi-fast.network /etc/systemd/network/wlp.network
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    echo -e "Switched to fast network settings."
}

function switch_off(){
    sudo rm -r /etc/systemd/network/enp.network
    sudo rm -r /etc/systemd/network/wlp.network
    sudo cp /home/harm/20-wired.network /etc/systemd/network/enp.network
    sudo cp /home/harm/25-wifi.network /etc/systemd/network/wlp.network
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    echo -e "Switched to default network settings."
}

function switch_vlan(){
    sudo rm -r /etc/systemd/network/enp.network
    sudo cp /home/harm/vlan.network /etc/systemd/network/
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    echo -e "Switched to vlans cctv and sysnet."
}
