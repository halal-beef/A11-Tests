#
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

DEVICE_PATH := device/nokia/Wasp

# Copy TWRP ramdisk files automatically
TARGET_RECOVERY_DEVICE_DIRS := device/nokia/Wasp/recovery/root
TARGET_DEVICE := Wasp

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armv8-a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)

# Bootloader
#Gotron-GQ3096TF2
#TARGET_BOOTLOADER_BOARD_NAME := mt6785
#TARGET_NO_BOOTLOADER := true
#TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := mt6761

# Assert
TARGET_OTA_ASSERT_DEVICE := Wasp,Wasp

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_DTB_OFFSET := 0x07808000
BOARD_INCLUDE_RECOVERY_DTBO := false
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

TARGET_PREBUILT_KERNEL := device/nokia/Wasp/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
#BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo
BOARD_PREBUILT_DTBIMAGE_DIR := device/nokia/Wasp/prebuilt/dtb

BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# AVB tagged because we dont have access to any keys
#BOARD_AVB_ENABLE := true
#BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
#BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
#BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
#BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Dynamic Partitions tagged because nokia 2.2 has no dynam parts
#BOARD_SUPER_PARTITION_SIZE := 7327449088
#BOARD_SUPER_PARTITION_GROUPS := main
#BOARD_MAIN_SIZE := 7327449088
#BOARD_MAIN_PARTITION_LIST := system vendor

#add stuff
BOARD_USES_RECOVERY_AS_BOOT

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x2000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xC0000000
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 0x30000000
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# System as root
#BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += data_mirror linkerconfig metadata

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := device/nokia/Wasp/recovery/root/system/etc/recovery.fstab
BOARD_HAS_LARGE_FILESYSTEM := true

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE := device/nokia/Wasp/recovery/root/vendor/etc/vintf/manifest.xml
#DEVICE_MATRIX_FILE := device/nokia/Wasp/recovery/root/vendor/etc/vintf/compatibility_matrix.xml

# Crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# TWRP specific build flags

TW_THEME := portrait_hdpi
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1520
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en
TW_NO_SCREEN_BLANK := true
TW_NO_BATT_PERCENT := false
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_NTFS_3G := true     
TW_INCLUDE_FUSE_EXFAT := true
TW_NO_SCREEN_TIMEOUT := true
TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_FB2PNG := true                     # Include Screenshot Support 
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 80
TW_Y_OFFSET := 20

#TW_THEME := portrait_hdpi
#DEVICE_SCREEN_WIDTH := 720
#DEVICE_SCREEN_HEIGHT := 1520
#RECOVERY_SDCARD_ON_DATA := true
#TW_EXCLUDE_DEFAULT_USB_INIT := true
#TW_EXTRA_LANGUAGES := true
#TW_INCLUDE_NTFS_3G := true
#TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
#TW_MAX_BRIGHTNESS := 2047
#TW_DEFAULT_BRIGHTNESS := 255
#TW_NO_SCREEN_BLANK := true
#TW_SCREEN_BLANK_ON_BOOT := true
#TW_Y_OFFSET := 16
#TW_H_OFFSET := -16
#TARGET_USES_MKE2FS := true
#TW_EXCLUDE_TWRPAPP := true
#TW_OVERRIDE_SYSTEM_PROPS := \
#    "ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.name=ro.product.system.name"

# resetprop and magiskboot
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# TW Version
TW_DEVICE_VERSION := 3.5.2_11 By areallydumbperson On XDA
