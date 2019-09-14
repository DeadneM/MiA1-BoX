#!/bin/bash
cd /home/guest/Documents/MiA1BoX_ModuleMaker

if [ ! -d Releases/ ] | [ $(grep "MiA1") ]; then
echo "Zipping Module files"
else
echo "Module zip already there, so deleting the old ones"
rm -f Releases/*.zip
fi

cd MiA1BoX
zip -9 -r ../MiA1BoX.zip .
mv ../MiA1BoX.zip /home/guest/Documents/MiA1BoX_ModuleMaker/Releases/MiA1BoX-$( date +"%d%m%y-%H%M%S" ).zip
cd ../..

echo "Finished Zipping."

exit

