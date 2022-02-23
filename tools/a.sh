export CURRENTUSER=$(whoami)
SCRIPTDIR=$(readlink -f "$0")
CURRENTDIR=$(dirname "$SCRIPTDIR")
TOOLS=$CURRENTDIR
IMG=$CURRENTDIR/images
A=$CURRENTDIR/images/system
B=$CURRENTDIR/images/vendor
C=$CURRENTDIR/images/system_ext
D=$CURRENTDIR/images/product
E=$CURRENTDIR/images/odm
ROM=$(readlink -f "$1")

set -e

#MI
rm -r $IMG || true
mkdir $IMG $A $B $C $D $E 
printf "\n" 
printf "\n" 
printf "convertingzip files..."
printf "\n" 
printf "\n" 
sleep 1s
#SYSTEM
if unzip -d $A $ROM system.transfer.list system.new.dat.br
then
brotli -j -v -d $A/system.new.dat.br -o $A/system.new.dat 
$TOOLS/sdat2img/sdat2img.py $A/system.transfer.list $A/system.new.dat $A/system.img 
printf "\n" 
printf "\n" 
printf "converting system..."
printf "\n" 
rm -r $A/system.new.dat $A/system.transfer.list
else
echo "skipping system - not founded" 
sleep 1s
fi
#VENDOR
if unzip -d $B $ROM vendor.transfer.list vendor.new.dat.br 
then
printf "\n" 
printf "\n" 
brotli -j -v -d $B/vendor.new.dat.br -o $B/vendor.new.dat 
$TOOLS/sdat2img/sdat2img.py $B/vendor.transfer.list $B/vendor.new.dat $B/vendor.img 
printf "converting vendor..."
rm -r $B/vendor.new.dat $B/vendor.transfer.list
else
echo "skipping vendor - not founded" 
sleep 1s
fi
#SYSTEM_EXT
if unzip -d $C $ROM system_ext.transfer.list system_ext.new.dat.br 
then
printf "\n" 
printf "\n"
brotli -j -v -d $C/system_ext.new.dat.br -o $C/system_ext.new.dat 
$TOOLS/sdat2img/sdat2img.py $C/system_ext.transfer.list $C/system_ext.new.dat $C/system_ext.img 
printf "converting system_ext..."
rm -r $C/system_ext.new.dat $C/system_ext.transfer.list
else
echo "skipping system_ext - not founded" 
sleep 1s
fi
#PRODUCT
if unzip -d $D $ROM product.transfer.list product.new.dat.br 
then
printf "\n" 
printf "\n"
brotli -j -v -d $D/product.new.dat.br -o $D/product.new.dat 
$TOOLS/sdat2img/sdat2img.py $D/product.transfer.list $D/product.new.dat $D/product.img 
printf "converting product..."
rm -r $D/product.new.dat $D/product.transfer.list
else
echo "skipping product - not founded"
sleep 1s 
fi
#ODM
if unzip -d $E $ROM odm.transfer.list odm.new.dat.br 
then
printf "\n" 
printf "\n"
brotli -j -v -d $E/odm.new.dat.br -o $E/odm.new.dat 
$TOOLS/sdat2img/sdat2img.py $E/odm.transfer.list $E/odm.new.dat $E/odm.img 
printf "\n"
printf "convertin godm..."
rm -r $E/odm.new.dat $E/odm.transfer.list 
else
echo "skipping odm - not founded" 
sleep 1s
fi	
cd $CURRENTDIR 
mv $IMG ..	
printf "process finished"
printf "\n" 
printf "go to designed folder and you can close this terminal now..."
printf "\n" 
