#!/bin/bash




setting_node(){

    sudo apt update -y
    sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
    sleep 5
    sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y


    cd

    git clone https://github.com/xmrig/xmrig.git
    cd xmrig


    mkdir build
    cd build


    cmake ..
    make

    sleep 5

    sudo apt update -y

    sudo apt upgrade -y

    cd ..
    cd ..

    mv /xmrig/ /root/
    mv /monero-mining/monerov2.sh /root/

}



starting_node(){

    cd /xmrig/build/
    # ./xmrig -o xmrpool.eu:5555 -u 48VkHpipcwX2GQoRF1aGQ5FqwUD3sHgGFWC96D5wQPL99YfndBV9s2F66GcNsrAPgiGamukjtc3QMD59ZxXhCLMjN359VR7 -p node01
    read -p " What's the name of your node? :  " namenode

    read -p " Wich pool do you want? [by default xmrpool.eu:5555] : " pool
    if [[ $pool=="" ]]
    then
        pool="xmrpool.eu:5555"
    fi

    read -p " Choose your Wallet [by default 48VkHpipcwX2GQoRF1aGQ5FqwUD3sHgGFWC96D5wQPL99YfndBV9s2F66GcNsrAPgiGamukjtc3QMD59ZxXhCLMjN359VR7 ] : " wallet
    if [[ $wallet=="" ]]
    then
        wallet="48VkHpipcwX2GQoRF1aGQ5FqwUD3sHgGFWC96D5wQPL99YfndBV9s2F66GcNsrAPgiGamukjtc3QMD59ZxXhCLMjN359VR7"
    fi

    # ./xmrig -o xmrpool.eu:5555 -u 48VkHpipcwX2GQoRF1aGQ5FqwUD3sHgGFWC96D5wQPL99YfndBV9s2F66GcNsrAPgiGamukjtc3QMD59ZxXhCLMjN359VR7 -p node01
    ./xmrig -o $pool -u $wallet -p $namenode

}

set_auto_launch_at_boot(){
    echo ' Nope! work in progress '
}




##########################################################################################################################################################

##########################################################################################################################################################

echo " Welcome to this lil prog for setting a XMR node include on pool "
read -p " Wich part to apply ?
1: Setting node 
2: Starting node
3: Setting the 'launch at reboot' " rep

case $rep in

    1)

        setting_node
        ;;
    2)

        starting_node
        ;;
    3)
        echo "Warning - Work In Progress"
        set_auto_launch_at_boot
        ;;
esac

echo ""
echo ""

sleep 3
echo " Have a good One "