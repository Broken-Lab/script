echo -e "resist15-ROM-Build Script"
printf "Enter A Rom To Build \n1=Radiant\n2=Cipher\n="
read ROM
if [[ $ROM -eq 1 ]]
then
  echo -e "Syncing Radiant Sources"
  repo init -u https://github.com/ProjectRadiant/manifest -b twelve
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags -v
  echo -e "Cloning Beryllium Radiant Trees"
  git clone https://github.com/RadiantDevices/device_xiaomi_beryllium device/xiaomi/beryllium
  git clone https://github.com/RadiantDevices/device_xiaomi_sdm845-common device/xiaomi/sdm845-common
  git clone --depth 1 https://github.com/RadiantDevices/vendor_xiaomi_beryllium vendor/xiaomi
  git clone --depth 1 -b twelve https://github.com/PainKiller3/kernel_xiaomi_sdm845.git kernel/xiaomi/sdm845
  curl -sL https://gist.githubusercontent.com/resist15/5cfd6138eb138abb94541af2a7fa46fa/raw/4b851c9d802129c4c4fab7eb6581ea59668002a5/resist15.sh | bash
elif [[ $ROM -eq 2 ]]
then
  echo -e "Syncing CipherOS Sources"
  repo init --depth 1 -u https://github.com/CipherOS/manifest -b twelve
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags -v
  echo -e "Cloning Beryllium Radiant Trees"
  git clone https://github.com/resist15/android_device_xiaomi_beryllium -b twelve device/xiaomi/beryllium    
  git clone https://github.com/resist15/android_device_xiaomi_sdm845-common -b twelve device/xiaomi/sdm845-common
  git clone --depth 1 https://github.com/resist15/android_vendor_xiaomi -b twelve vendor/xiaomi          
  git clone --depth 1 -b twelve https://github.com/PainKiller3/kernel_xiaomi_sdm845.git kernel/xiaomi/sdm845
  curl -sL https://gist.githubusercontent.com/resist15/5ff86432439af446a73f9360bbb1258c/raw/4b42088eae0d28723762ca5b4ea9d36e299b1bbc/cipher.sh | bash

else
  echo -e "Script Terminated Wrong Input Value"
fi

