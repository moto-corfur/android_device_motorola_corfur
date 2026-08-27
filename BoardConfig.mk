#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/corfur

# Inherit from motorola sm6375-common
include device/motorola/sm6375-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := corfur

# Display
TARGET_SCREEN_DENSITY := 400

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 7256141824
BOARD_SUPER_PARTITION_SIZE := 14512291840

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 16
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 16

# inherit from the proprietary version
include vendor/motorola/corfur/BoardConfigVendor.mk
