#!/bin/bash

while true
do

# Logo

echo -e '\e[40m\e[91m'
echo -e '  ____                  _                    '
echo -e ' / ___|_ __ _   _ _ __ | |_ ___  _ __        '
echo -e '| |   |  __| | | |  _ \| __/ _ \|  _ \       '
echo -e '| |___| |  | |_| | |_) | || (_) | | | |      '
echo -e ' \____|_|   \__  |  __/ \__\___/|_| |_|      '
echo -e '            |___/|_|                         '
echo -e '    _                 _                      '
echo -e '   / \   ___ __ _  __| | ___ _ __ ___  _   _ '
echo -e '  / _ \ / __/ _  |/ _  |/ _ \  _   _ \| | | |'
echo -e ' / ___ \ (_| (_| | (_| |  __/ | | | | | |_| |'
echo -e '/_/   \_\___\__ _|\__ _|\___|_| |_| |_|\__  |'
echo -e '                                       |___/ '
echo -e '\e[0m'

sleep 2

# Menu

PS3='Select an action: '
options=(
"Install and Create Wallet"
"Request tokens in discord"
"Create NFT"
"Clean up!"
"Exit")
select opt in "${options[@]}"
do
case $opt in

"Install and Create Wallet")
echo "============================================================"
echo "Install start"
echo "============================================================"

#UPDATE APT
sudo apt update && sudo apt upgrade -y
sudo apt install make clang pkg-config libssl-dev

#INSTALL RUST
curl https://sh.rustup.rs -sSf | sh
rustup update stable
source ~/.profile
source ~/.cargo/env
cargo -V

#INSTALL SUI
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch "devnet" sui
which wallet
wallet active-address

echo "============================================================"
echo "Save address"
echo "============================================================"

break
;;

"Request tokens in discord")
echo "========================================================================================================================"
echo "Go to the Discord server #devnet-faucet and request tokens in the faucet channel in the format !faucet <your_address>"
echo "========================================================================================================================"

break
;;

"Create NFT")
echo "============================================================"
echo "Create NFT"
echo "============================================================"

wallet create-example-nft
wallet create-example-nft --url=https://yt3.ggpht.com/CGCJ3lEQws6WIOCLHcdNLsZfq3d91inG1vamQ6OLTnH1pTuIOwMOWnoV662suF9p9koKk1fOhv8=s900-c-k-c0x00ffffff-no-rj --description="Crypton Academy" --name="Crypton"
git clone https://github.com/MystenLabs/sui.git
wallet publish --path sui/sui_programmability/tutorial --gas-budget 30000
echo "========================================================================================================================"
echo "Save package object ID and Forge object ID"
echo "========================================================================================================================"

break
;;

"Clean up!")
cleanup

break
;;

"Exit")
exit
;;
*) echo "invalid option $REPLY";;
esac
done
done
