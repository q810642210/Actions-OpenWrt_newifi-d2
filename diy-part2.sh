#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate
# 修改固件名显示内核版本
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=k$(LINUX_VERSION)-/g' include/image.mk
# 修改固件内核版本
sed -i '/^KERNEL_PATCHVER:=/c\KERNEL_PATCHVER:=5.4' target/linux/x86/Makefile
# 默认开启Wifi
sed -i 's/disabled=1/disabled=0/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh
