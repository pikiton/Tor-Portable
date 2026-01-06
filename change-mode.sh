#!/usr/bin/env bash
cd "$(dirname "$0")"
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
PS3='Welcome to the mode control panel. Do you want to set the mode to pro, set the mode to default, or remove middle nodes?'
options=("Change the mode to pro" "Change the mode to default" "Remove middle nodes")
select opt in "${options[@]}"
do
    case $opt in
        "Change the mode to pro")
            cp ./change-mode/pro/torrc.txt torrc.txt
            read -p "The mode was changed to pro."
            ;;
        "Change the mode to default")
            cp ./change-mode/default/torrc.txt torrc.txt
            read -p "The mode was changed to default."
            ;;
        "Remove middle nodes")
            sed -i 's/MiddleNodes/#MiddleNodes/' torrc.txt
            read -p "Middle nodes were removed"
            ;;
    esac
done
