#
# Copyright 2020 The Android Open-Source Project
# Copyright 2023 The RisingOS Android Project
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

$(call inherit-product, device/google/gs101/aosp_common.mk)
$(call inherit-product, device/google/raviole/device-oriole.mk)
$(call inherit-product, device/google/raviole/lineage_oriole.mk)

# Inherit risingOS vendor configs
$(call inherit-product, vendor/rising/config/rising.mk)

# Device Identifiers
PRODUCT_BRAND := google
PRODUCT_DEVICE := oriole
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := Pixel 6
PRODUCT_NAME := rising_oriole

# RisingOS variables
RISING_MAINTAINER := minaripenguin
RISING_CHIPSET := GS101

# Addons
TARGET_HAS_UDFPS := true

# Gms variables
WITH_GMS := true

# Set Pixel launcher as default launcher
TARGET_PREBUILT_PIXEL_LAUNCHER := true

# Ship Pixel features (adaptivecharging, dreamliner etc)
TARGET_ENABLE_PIXEL_FEATURES := true

# Use Google telephony framework
TARGET_USE_GOOGLE_TELEPHONY := true

# Ship Google Camera 
TARGET_PREBUILT_GOOGLE_CAMERA := true

# Use gs101 hotword blobs
TARGET_PREBUILT_HOTWORD := true
TARGET_PREBUILT_HOTWORD_TYPE := tensor_gs101

# Keep the VNDK APEX in /system partition for REL branches as these branches are
# expected to have stable API/ABI surfaces.
ifneq (REL,$(PLATFORM_VERSION_CODENAME))
  PRODUCT_PACKAGES += com.android.vndk.current.on_vendor
endif
