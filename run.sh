#!/bin/bash

sudo apt update
sudo apt install -y multistrap binfmt-support binfmt-support qemu-user-static debootstrap qemu-system-mips binwalk
# wget https://download.iptime.co.kr/online_upgrade/a1004ns_ml_12_152.bin
cp ./resources/a1004ns_ml_12_152.bin .
cp ./resources/mips-rootfs.tar.gz .

sudo binwalk ./a1004ns_ml_12_152.bin # if you want to see detail of binary.
sudo binwalk -e ./a1004ns_ml_12_152.bin --run-as=root
mkdir ./_a1004ns_ml_12_152.bin.extracted/squashfs-root/root
tar -zxf mips-rootfs.tar.gz -C ./_a1004ns_ml_12_152.bin.extracted/squashfs-root/root

cd ./_a1004ns_ml_12_152.bin.extracted/squashfs-root/
sudo cp /usr/bin/qemu-mips-static ./

sudo chroot . ./qemu-mipsel-static ./bin/ash

echo "cd ~/mips-rootfs && chroot ."





