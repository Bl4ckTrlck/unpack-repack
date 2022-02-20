rm -rf output/
mkdir coverted
img2simg system.img coverted/system.img || true
python3 tools/img2sdat/img2sdat.py coverted/system.img -o output -v 4 -p system || true
brotli -4fk output/system.new.dat || true
rm -rf output/system.new.dat  || true

img2simg system_ext.img coverted/system_ext.img || true
python3 tools/img2sdat/img2sdat.py coverted/system_ext.img -o output -v 4 -p system_ext || true
brotli -4fk output/system_ext.new.dat || true
rm -rf output/system_ext.new.dat  || true

img2simg vendor.img coverted/vendor.img || true
python3 tools/img2sdat/img2sdat.py coverted/vendor.img -o output -v 4 -p vendor || true
brotli -4fk output/vendor.new.dat || true
rm -rf output/vendor.new.dat  || true 

img2simg product.img coverted/product.img || true
python3 tools/img2sdat/img2sdat.py coverted/product.img -o output -v 4 -p product || true
brotli -4fk output/product.new.dat || true
rm -rf output/product.new.dat || true

img2simg odm.img coverted/odm.img || true
python3 tools/img2sdat/img2sdat.py coverted/odm.img -o output -v 4 -p odm || true
brotli -4fk output/odm.new.dat || true
rm -rf output/odm.new.dat || true

cd output
cd ..
rm -rf coverted
printf "Enjoy!"

