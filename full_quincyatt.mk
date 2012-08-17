# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
 
#
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#
 
# Torch
PRODUCT_PACKAGES := \
    Torch

BOARD_HAVE_NFC := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from quincyatt device
$(call inherit-product, device/samsung/quincyatt/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_quincyatt
PRODUCT_DEVICE := quincyatt
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SAMSUNG-SGH-I717

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-scan=false \
    ro.vendor.extension_library=/system/lib/libqc-opt.so \
    ro.qualcomm.cabl=0 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.gmsversion=4.0_r2 \
    ro.ril.set.mtu1472=1 \
    persist.sys.usb.config=mass_storage \
    dalvik.vm.checkjni=false \
    dalvik.vm.dexopt-flags=m=y,v=n,o=v \
    ro.cm.version=h0tsauce-9-$(shell date -u +%Y%m%d) \
    ro.modversion=$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.developerid=h0tw1r3 \
    ro.goo.developerid=h0tw1r3 \
    ro.goo.rom=h0tsauce-9 \
    ro.goo.version=$(shell date -u +%Y%m%d) \
    ro.goo.board=SGH-I717

# boot animation sound
PRODUCT_COPY_FILES += \
    device/samsung/quincyatt/boot_audio.mp3:system/media/boot_audio.mp3

# custom init script
PRODUCT_COPY_FILES += \
    device/samsung/quincyatt/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh
