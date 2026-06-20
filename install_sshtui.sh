#!/bin/env bash

echo "sshTUI installer:"
read -r -p "Would you like to install the sshTUI? [y/N] " response

case "$response" in
    [yY][eE][sS]|[yY][tT]

        echo ""
        echo "-----------------Downloading------------------"
        echo ""

    curl -s -o sshtui https://raw.githubusercontent.com/grzesiowski1223/sshtui/main/install_sshtui.sh

        if [[ ! -f sshtui ]]; then
            echo -e "${RED}Download failed. Please check the URL or your internet connection.${NC}"
            exit 1
        fi

        sed -i "s|^IPADDRESS=.*$|IPADDRESS=\"$ip\"|" oss
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
