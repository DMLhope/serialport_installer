#!/bin/env bash
set -x

disk_path=""

main(){

echo "welcome,Now we will install UOS"
echo "please check which disk you want to install"

lsscsi

while true
do
read -rp "Which disk you want to install ? (Please input full disk path,like:/dev/sda) :" disk_path
echo "${disk_path}"
if [ "$disk_path" == "exit" ];then
	exit 1
fi

if [ -z "${disk_path}" ];then
	echo "value is nil, please input again"
	continue
fi

lsblk "${disk_path}"
if lsblk "${disk_path}" ;then
	break
fi
done

ddRootfs "${disk_path}"

updateDisk "${disk_path}"


}

ddRootfs(){
if [ -f /run/live/medium/rootfs.img ];then
	dd if=/run/live/medium/rootfs.img of="$1" bs=1M
else
	if [ -f /rootfs.img ];then
		dd if=/rootfs.img of="$1" bs=1M
	else
		echo "Error /rootfs.img lost"
		exit 2
	fi	
fi
echo "Please wait..."
}

updateDisk(){
	echo "Update disk part..."
	parted "$1" rm 1
	parted "$1" mkpart primary 0% 100%
	e2fsck -f "$1"1
	resize2fs "$1"1
}

updateUuid(){
	echo "Update UUID ..."
	tune2fs -U 46c9df11-afc8-452a-855a-3d11b8ff1d31 "$1"1
}


main
