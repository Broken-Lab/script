echo -e "resist15-ROM-Build Script"
printf "Enter A Rom To Build \n1=Radiant\n2=Cipher\n="
read ROM
if [[ $ROM -eq 1 ]]
then
  echo -e "Fetching Radiant Specific Stuffs"
  chmod +x clone_rdnt.sh && bash clone_rdnt.sh
  curl -sL https://gist.githubusercontent.com/resist15/5cfd6138eb138abb94541af2a7fa46fa/raw/4b851c9d802129c4c4fab7eb6581ea59668002a5/resist15.sh | bash
elif [[ $ROM -eq 2 ]]
then
  echo -e "Fetching Cipher Specific Stuffs"
  chmod +x clone_cphr.sh && bash clone_cphr.sh
  curl -sL https://gist.githubusercontent.com/resist15/5ff86432439af446a73f9360bbb1258c/raw/4b42088eae0d28723762ca5b4ea9d36e299b1bbc/cipher.sh | bash

else
  echo -e "Script Terminated Wrong Input Value"
fi

