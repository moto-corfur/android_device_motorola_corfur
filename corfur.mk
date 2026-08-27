#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from corfur device
$(call inherit-product, device/motorola/corfur/device.mk)

# Inherit from the Neoteric configuration.
$(call inherit-product, vendor/neoteric/target/product/neoteric-target.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := corfur
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := moto g71 5G
PRODUCT_NAME := corfur

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="corfur_g-user 12 S2RUBS32.51-15-9-17 5404f0-d7d7e9 release-keys" \
    BuildFingerprint=motorola/corfur_g/corfur:12/S2RUBS32.51-15-9-17/5404f0-d7d7e9:user/release-keys \
    DeviceProduct=corfur_g
