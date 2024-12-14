# Installation PROOT-DISTRO

## Setup Termux
```bash
pkg update -y && pkg upgrade -y

termux-setup-storage

pkg install proot-distro
```

## Install Ubuntu
```bash
proot-distro install ubuntu-oldlts

proot-distro login ubuntu-oldlts
```

## Update Ubuntu System
```bash
apt update -y && apt upgrade -y
```

## Install Required Packages
```bash
apt install neofetch -y && apt install git -y
```

## Install Go Programming Language
```bash
wget https://go.dev/dl/go1.23.3.linux-arm64.tar.gz

tar -C /usr/local -xzf go1.23.3.linux-arm64.tar.gz
```

## Configure Go Environment
```bash
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc

source ~/.bashrc
```

## Cleanup
```bash
rm go1.23.3.linux-arm64.tar.gz
```


## AUTOMATE INSTALLATION
```bash
bash <(curl -s https://raw.githubusercontent.com/LINUX-TEMPLATE/TERMUX-NOTE/main/script.sh)
```