#!/bin/bash

#set -x

apt install git -y

apt install build-essential -y

apt install cmake -y

apt install libuv1-dev -y

apt install libssl-dev -y

apt install libhwloc-dev -y

git clone https://github.com/xmrig/xmrig.git

mkdir xmrig/build

cd xmrig/build

clear
echo
echo -e "\t\tChoose install type"
echo
echo -en "1.Minimal install (Monero/XMR)"
echo -e "\t2.Full install"
echo
echo -en "\t\t\tType: "

read -n 1 type
if [ "$type" -eq 1 ]
then
cmake .. -DWITH_CN_LITE=OFF -DWITH_CN_HEAVY=OFF -DWITH_CN_PICO=OFF \
 -DWITH_CN_FEMTO=OFF -DWITH_ARGON2=OFF -DWITH_ASTROBWT=OFF \
 -DWITH_KAWPOW=OFF -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_MSR=OFF \
 -DWITH_SSE4_1=OFF -DWITH_BENCHMARK=OFF 
else cmake ..

make -j$(nproc)
exit
