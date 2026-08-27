#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
    vendor/lib64/camera/components/com.qti.node.dewarp.so |
    vendor/lib64/camera/components/com.vidhance.node.ica.so |
    vendor/lib64/camera/components/com.vidhance.node.processing.so)
        "${PATCHELF}" --replace-needed libui.so libui-v34.so "${2}"
        ;;
    vendor/lib64/sensors.moto.so)
        "${PATCHELF}" --add-needed libbase_shim.so "${2}"
        ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=corfur
export DEVICE_COMMON=sm6375-common
export VENDOR=motorola
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
