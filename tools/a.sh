export CURRENTUSER=$(whoami)
SCRIPTDIR=$(readlink -f "$0")
CURRENTDIR=$(dirname "$SCRIPTDIR")
TOOLS=$CURRENTDIR/tools
A=$CURRENTDIR/system/
B=$CURRENTDIR/vendor/
C=$CURRENTDIR/system_ext/
D=$CURRENTDIR/product/
E=$CURRENTDIR/odm/
ROM=$(readlink -f "$1")
if [[ -z $ROM ]] 
then
echo "usage: ./a.sh rom.zip" && exit
fi
set -e

#MI
sudo chmod +x $TOOLS/*
sudo rm -rf $A $B $C $D $E || true
mkdir $A $B $C $D $E || true
printf "\n" 
printf "\n" 
printf "extracting zip files..."
printf "\n" 
printf "\n" 

#Extract zip
unzip -d $A $ROM system.transfer.list system.new.dat.br || true
printf "\n" 
unzip -d $B $ROM vendor.transfer.list vendor.new.dat.br || true
printf "\n" 
unzip -d $C $ROM system_ext.transfer.list system_ext.new.dat.br || true
printf "\n" 
unzip -d $D $ROM product.transfer.list product.new.dat.br || true
printf "\n" 
unzip -d $E $ROM odm.transfer.list odm.new.dat.br || true
printf "\n" 

#IMGS
brotli -j -v -d $A/system.new.dat.br -o $A/system.new.dat || true
$TOOLS/sdat2img.py $A/system.transfer.list $A/system.new.dat $A/system.img || true
printf "\n" 
brotli -j -v -d $B/vendor.new.dat.br -o $B/vendor.new.dat || true
$TOOLS/sdat2img.py $B/vendor.transfer.list $B/vendor.new.dat $B/vendor.img || true
printf "\n"
brotli -j -v -d $C/system_ext.new.dat.br -o $C/system_ext.new.dat || true
$TOOLS/sdat2img.py $C/system_ext.transfer.list $C/system_ext.new.dat $C/system_ext.img || true
printf "\n"
brotli -j -v -d $D/product.new.dat.br -o $D/product.new.dat || true
$TOOLS/sdat2img.py $D/product.transfer.list $D/product.new.dat $D/product.img || true
printf "\n"
brotli -j -v -d $E/odm.new.dat.br -o $E/odm.new.dat || true
$TOOLS/sdat2img.py $E/odm.transfer.list $E/odm.new.dat $E/odm.img || true
printf "\n"

rm -r $A/system.new.dat $A/system.transfer.list $B/vendor.new.dat $B/vendor.transfer.list $C/system_ext.new.dat $C/system_ext.transfer.list $D/product.new.dat $D/product.transfer.list $E/odm.new.dat $E/odm.transfer.list  || true
	
printf "process finished"
printf "\n" 
printf "go to designed folder and you can close this terminal now..."
printf "\n" 
