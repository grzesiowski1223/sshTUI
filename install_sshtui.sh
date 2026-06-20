#!/usr/bin/env bash

RED='\033[31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e "${PURPLE}sshTUI installer:${NC}"
read -r -p "Would you like to install the sshTUI? [y/N] " response

case "$response" in
[yY][eE][sS] | [yY])
  echo ""
  echo "-----------------Downloading------------------"
  echo ""

  curl -s -o sshtui https://raw.githubusercontent.com/grzesiowski1223/sshtui/main/sshtui

  if [[ ! -f sshtui ]]; then
    echo -e "${RED}Download failed. Please check the URL or your internet connection.${NC}"
    exit 1
  fi

  chmod +x sshtui
  
  if sudo cp sshtui /usr/local/bin/; then
    echo -e "${GREEN}The installation is successful.${NC}"
    echo "You can now run 'sshtui' as a command!"
    rm sshtui
  else
    echo -e "${RED}The installation was unsuccessful.${NC}"
    exit 1
  fi
  ;;
*)
  echo "Exiting..."
  exit 0
  ;;
esac
