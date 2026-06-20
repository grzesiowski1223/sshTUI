#!/bin/env bash

RED=$(echo -e '\033[31m')
GREEN=$(echo -e '\033[0;32m')
PURPLE=$(echo -e '\033[0;35m')
NC=$(echo -e '\033[0m')

echo -e "${PURPLE}sshTUI installer:${NC}"
read -r -p "Would you like to install the sshTUI? [y/N] " response

case "$response" in
    [yY][eE][sS]|[yY])
        echo ""
        echo "-----------------Downloading------------------"
        echo ""

        # TUTAJ: Pobieramy aplikację 'sshtui', a nie instalator!
        curl -s -o sshtui https://raw.githubusercontent.com/grzesiowski1223/sshTUI/main/sshtui

        if [[ ! -f sshtui ]]; then
            echo -e "${RED}Download failed. Please check the URL or your internet connection.${NC}"
            exit 1
        fi

        if [[ -n "$ip" ]]; then
            sed -i "s|^IPADDRESS=.*$|IPADDRESS=\"$ip\"|" sshtui
        fi
        
        chmod +x sshtui
        sudo cp sshtui /usr/local/bin/

        echo -e "${GREEN}The installation is successful.${NC}"
        echo "You can now run 'sshtui' as a command!"
        ;;
    *)
        echo "Exiting..."
        exit
        ;;
esac
