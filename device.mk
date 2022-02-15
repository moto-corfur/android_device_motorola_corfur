#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true
    
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service \
    bootctrl.holi \
    bootctrl.holi.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Emulated storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# fastbootd
PRODUCT_PACKAGES += \
  	android.hardware.fastboot@1.0-impl-mock \
	  fastbootd

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.crda.sh \
    init.kernel.post_boot-blair.sh \
    init.kernel.post_boot-holi.sh \
    init.kernel.post_boot.sh \
    init.mmi.boot.sh \
    init.mmi.touch.sh \
    init.oem.fingerprint.overlay.sh \
    init.oem.fingerprint2.sh \
    init.oem.hw.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    init.qti.kernel.sh \
    vendor_modprobe.sh

PRODUCT_PACKAGES += \
    fstab.default \
    init.mmi.charge_only.rc \
    init.mmi.chipset.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.qcom.rc \
    init.qti.kernel.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    init.vendor.st21nfc.rc \
    ueventd.qcom.rc

# Moto hardware
PRODUCT_PACKAGES += \
    MotoActions \
    MotoCommonOverlay

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Shipping level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Treble
PRODUCT_VENDOR_MOVE_ENABLED := true
BOARD_VNDK_VERSION := current

# Update engine
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/corfur/corfur-vendor.mk)
