CURRENTUSER=$(whoami)
SCRIPTDIR=$(readlink -f "$0")
CURRENTDIR=$(dirname "$SCRIPTDIR")
FIL=$CURRENTDIR/tools
DAT=$CURRENTDIR/dat
sudo chmod +x $FIL/sdat2img/*
sudo chmod +x $FIL/img2sdat/*
sudo chmod +x $FIL/*
if [ $CURRENTUSER == root ]
then
echo "do not run as root" && exit
fi


echo "Multi Tool"
echo "Extract rom files - 1"
echo "convert .dat.br to img - 2"
echo "convert img to .dat.br - 3"
echo "convert payload to img -4 (not working for now)"


read -p "wich ? " OPTION

#extract
if [ "$OPTION" = "1" ]
then
sudo rm -rf files || true
echo "add your rom-zip location or only drag here"
read -p "zip: " ZIP
sudo su -c "$FIL/all.sh $ZIP $CURRENTUSER"
sudo chmod -R 777 files
fi

#toimg
if [ "$OPTION" = "2" ]
then
sudo rm -rf images || true
echo "add your rom-zip location or only drag here"
read -p "zip: " ZIP
sudo su -c "$FIL/a.sh $ZIP $CURRENTUSER"
sudo chmod -R 777 images
fi

#todat
if [ "$OPTION" = "3" ]; then
sudo rm -r $DAT || true
echo " please add your imgs on the dat folder \n"
mkdir $DAT || true
printf " supported partitions \n \n -system.img \n -system_ext.img \n -vendor.img \n -product.img \n -odm.img \n"
echo "press enter when you finish"
read
sudo su -c "$FIL/dat.sh $DAT $CURRENTUSER"
fi
