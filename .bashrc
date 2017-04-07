#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto'
PS1='[\u@\h \W]\$ '

# for keychain autostart
# eval $(keychain --agents ssh,gpg --noask --nogui --eval --quiet ~/.ssh/keys --confhost ~/.ssh/config)

function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

    if (( $# > 0 )); then
        valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\)\{4\}:\([0-9]\+\)/&/p')
        if [[ $valid != $@ ]]; then
            >&2 echo "Invalid address"
            return 1
        fi

        export http_proxy="http://$1/"
        export https_proxy=$http_proxy
        export ftp_proxy=$http_proxy
        export rsync_proxy=$http_proxy
        echo "Proxy environment variable set."
        return 0
    fi

#    echo -n "username: "; read username
#    if [[ $username != "" ]]; then
#        echo -n "password: "
#        read -es password
#        local pre="$username:$password@"
#    fi

    echo -n "server: "; read server
    echo -n "port: "; read port
    export http_proxy="http://$pre$server:$port/"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export HTTP_PROXY=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export FTP_PROXY=$http_proxy
    export RSYNC_PROXY=$http_proxy
}

function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset RSYNC_PROXY
    echo -e "Proxy environment variable removed."
}

function switch_irc(){
    sudo rm -r /etc/systemd/network/25*
    sudo cp /home/harm/25-irc.network /etc/systemd/network/
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    echo -e "Switched to irc network settings."
}

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
