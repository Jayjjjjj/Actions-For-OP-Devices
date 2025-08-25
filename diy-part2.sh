#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/ImmortalWrt/ImmortalWrt-24.10-5.4-$(shell TZ="Asia/Shanghai" date +"%Y%m%d")/g' package/base-files/files/bin/config_generate

# Modify filename, add date prefix
sed -i 's|IMG_PREFIX:=$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)$(BOARD)-$(SUBTARGET)|IMG_PREFIX:=$(VERSION_DIST_SANITIZED)-2410-5.4-$(shell TZ="Asia/Shanghai" date +"%Y%m%d")-$(SUBTARGET)|' include/image.mk
