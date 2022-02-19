echo -e "---Junk-Cleaning-Will-Start-Now---"
sleep 2 
echo -e "Detecting Cache Size"
du -sh /var/cache/pacman/pkg/
echo -e "Do You Want To Clean Cache ? (1=y/2=n)"
read VAL
if [[ $VAL -eq 1 ]]
then
    echo -e "Cleaning Packages"
    sudo pacman -Scc
else
    :
fi
clear
echo -e "Detecting Orphan Packages"
sudo pacman -Qtdq
echo -e "Do You Want to Clean Orphans ? (1=y,2=n)"
read ORP
if [[ $ORP -eq 1 ]]
then
    echo -e "Cleaning Orphans"
    sudo pacman -Rns $(pacman -Qtdq)
else
    :
fi
clear
echo -e "Listing Home Directory Cache"
sudo du -sh ~/.cache/
echo -e "Cleaning Home Directory Cache"
rm -rf ~/.cache/*
echo -e "Installing ndcu for removing large packages"
sudo pacman -S ncdu
echo -e "----------------------------------------------------------------------------"
echo -e " Run \"ncdu\"  in terminal and delete large files according to your need   "
echo -e "----------------------------------------------------------------------------"
