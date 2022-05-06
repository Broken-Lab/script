#!/usr/bin/bash

dt=(android_device_xiaomi_beryllium android_device_xiaomi_sdm845-common)
vt=(android_vendor_xiaomi)

gc() {
    echo "Cloning ${1}" 
    git clone https://github.com/"${1}" "${2}" --branch="${3}"
}
gcl() {
    echo "Cloning ${1}"
    git clone https://gitlab.com/"${1}" "${2}" --depth="${3}" --branch="${4}"
}
del(){
    echo "Deleting ${1}"
    rm -rf "${1}"
}

# Sync Source
repo init --depth 1 -u https://github.com/CipherOS/manifest -b twelve
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags -v

# Device Trees
gc resist15/"${dt[0]}" device/xiaomi/beryllium 1 twelve
gc resist15/"${dt[1]}" device/xiaomi/sdm845-common 1 twelve

# Vendor Trees
gc resist15/"${vt[0]}" vendor/xiaomi 1 twelve

# Kernel Tree
gc PainKiller3/kernel_xiaomi_sdm845 kernel/xiaomi/sdm845 1 twelve

# Toolchains
gcl varunhardgamer/trb_clang prebuilts/clang/host/linux-x86/clang-custom 1 14

# HALS and HW

# del hardware/qcom-caf/sdm845/audio
# del hardware/qcom-caf/sdm845/display
# del hardware/qcom-caf/sdm845/media

gc ArrowOS-Devices/android_hardware_xiaomi hardware/xiaomi twelve

# gc ArrowOS/android_hardware_qcom-caf_sdm845_audio hardware/qcom-caf/sdm845/audio arrow-12.0-caf-sdm845
# gc ArrowOS/android_hardware_qcom-caf_sdm845_display hardware/qcom-caf/sdm845/display arrow-12.0-caf-sdm845
# gc ArrowOS//android_hardware_qcom-caf_sdm845_media hardware/qcom-caf/sdm845/media arrow-12.0-caf-sdm845

cd ..