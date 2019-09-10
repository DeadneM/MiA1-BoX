#!/bin/bash
cd /home/guest/Documents/MiA1BoX_ModuleMaker

if [ ! -d MiA1BoX ]; then
echo "No Module Directory Found"
else
echo "Zipping Module files"

cd MiA1BoX
zip -9 -r ../MiA1BoX.zip .
mv ../MiA1BoX.zip /home/guest/Documents/MiA1BoX_ModuleMaker/Releases/MiA1BoX-$( date +"%d%m%y-%H%M%S" ).zip
cd ../..

echo "Finished Zipping."
fi
exit

