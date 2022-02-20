export CURRENTUSER=$(whoami)
SCRIPTDIR=$(readlink -f "$0")
CURRENTDIR=$(dirname "$SCRIPTDIR")
FIL=$CURRENTDIR/files
sudo chmod +x $FIL/sdat2img/*
sudo chmod +x $FIL/img2sdat/*
sudo chmod +x $FIL/payload/*
 
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
if [ "$OPTION" = "1" ]; then
sudo chmod +x $FIL/all.sh 
sudo su -c "$FIL/man.sh $PORTZIP $CURRENTUSER"
fi
if [ "$OPTION" = "2" ]; then
sudo chmod +x $FIL/a.sh 
sudo su -c "$FIL/mal.sh $PORTZIP $CURRENTUSER"
fi
if [ "$OPTION" = "3" ]; then
sudo chmod +x $FIL/dat.sh 
sudo su -c "$FIL/mal.sh $PORTZIP $CURRENTUSER"
fi
