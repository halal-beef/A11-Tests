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
LOCAL_PATH := device/nokia/Wasp

# Inherit from device
$(call inherit-product, device/Nokia/Wasp/device.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := Wasp
PRODUCT_NAME := twrp_Wasp
PRODUCT_BRAND := nokia
PRODUCT_MODEL := Wasp
PRODUCT_MANUFACTURER := nokia
PRODUCT_RELEASE_NAME := Wasp

PRODUCT_SHIPPING_API_LEVEL := 30

# define hardware platform
PRODUCT_PLATFORM := mt6761

# Set boot SPL
BOOT_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# Dynamic
#PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
#PRODUCT_PACKAGES += \
#    android.hardware.fastboot@1.0-impl-mock

# Bypass anti-rollback ROMs protection
# Set build date to Jan 1 2009 00:00:00
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.date.utc=1230768000

PRODUCT_GMS_CLIENTID_BASE := android-gotron

#PRODUCT_BUILD_PROP_OVERRIDES += \
#    TARGET_DEVICE=Power_Armor_13 \
#    PRODUCT_NAME=Power_Armor_13 \
#    PRIVATE_BUILD_DESC="full_k85v1_64-user 11 RP1A.200720.011 1626784999 release-keys"

#BUILD_FINGERPRINT := Ulefone/Power_Armor_13/Power_Armor_13:11/RP1A.200720.011/1626784999:user/release-keys
