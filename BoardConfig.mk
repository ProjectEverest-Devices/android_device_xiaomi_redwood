#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/redwood

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Board
TARGET_BOOTLOADER_BOARD_NAME := redwood

# Ignore overriding commands errors
BUILD_BROKEN_DUP_RULES := true

# Camera
TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_redwood
TARGET_RECOVERY_DEVICE_MODULES := libinit_redwood

# Kernel
TARGET_KERNEL_CONFIG += vendor/redwood_QGKI.config

# Kernel modules
BOOT_KERNEL_MODULES := \
    focaltech_touch.ko \
    goodix_core.ko \
    xiaomi_touch.ko
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 113254576128

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# SurfaceFlinger
TARGET_USE_AOSP_SURFACEFLINGER := true

# Include proprietary files
include vendor/xiaomi/redwood/BoardConfigVendor.mk
