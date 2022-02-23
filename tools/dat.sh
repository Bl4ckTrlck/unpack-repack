export CURRENTUSER=$(whoami)
SCRIPTDIR=$(readlink -f "$0")
CURRENTDIR=$(dirname "$SCRIPTDIR")
TOOLS=$CURRENTDIR
IMG=$(readlink -f "$1")
OUT=$CURRENTDIR/output
COV=$CURRENTDIR/coverted
rm -rf $OUT 
mkdir $COV 


#SYSTEM
if img2simg $IMG/system.img $COV/system.img 
then
python3 $TOOLS/img2sdat/img2sdat.py $COV/system.img -o output -v 4 -p system 
brotli -4fk $OUT/system.new.dat 
rm -rf $OUT/system.new.dat 
else
echo "skipping system - not founded" 
fi
#SYSTEM_EXT
if img2simg $IMG/system_ext.img $COV/system_ext.img 
then
python3 $TOOLS/img2sdat/img2sdat.py $COV/system_ext.img -o output -v 4 -p system_ext 
brotli -4fk $OUT/system_ext.new.dat 
rm -rf $OUT/system_ext.new.dat  
else
echo "skipping system_ext - not founded"
fi
#VENDOR
if img2simg $IMG/vendor.img $COV/vendor.img 
then
python3 $TOOLS/img2sdat/img2sdat.py $COV/vendor.img -o output -v 4 -p vendor 
brotli -4fk $OUT/vendor.new.dat 
rm -rf $OUT/vendor.new.dat   
else
echo "skipping vendor -not founded"
fi
#PRODUCT
if img2simg $IMG/product.img $COV/product.img 
then
python3 $TOOLS/img2sdat/img2sdat.py $COV/product.img -o output -v 4 -p product 
brotli -4fk $OUT/product.new.dat 
rm -rf $OUT/product.new.dat 
else
echo "skipping product -not founded"
fi
#ODM
if img2simg $IMG/odm.img $COV/odm.img 
then
python3 $TOOLS/img2sdat/img2sdat.py $COV/odm.img -o output -v 4 -p odm 
brotli -4fk $OUT/odm.new.dat 
rm -rf $OUT/odm.new.dat 
else
echo "skipping odm -not founded"
fi
cd $CURRENTDIR 
mv output ..
echo
printf "Enjoy! "
