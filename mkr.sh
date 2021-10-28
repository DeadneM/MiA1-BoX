#!/bin/bash
#Zip log
ZIPLOG=0
#Path to root of git repo # Need to match current root of module maker path
PATHGIT=~/Documents/MiA1-BoX
#Name of module folder # you can add MOD(NUMBER) path
MOD1=MiA1BoX
MOD2=N6BoX
MOD3=Pixel4aBoX
#Name of module that is zipped # should stay null
MODULEZIP=NULL
CONF=NULL

####################---Menu---#######################START
menu() {
    echo "Place your module here $PATHGIT"; echo "----------------------"; echo "-Magisk Module Zipper-"; echo "----------------------"
#Switch debug zip
if [ $ZIPLOG -eq "1" ]; then echo "Current debug switch is on"; else if [ $ZIPLOG -eq "0" ]; then echo "Current debug switch is off"; fi fi
        echo "Type 00 to switch debug zip"
#Exit
        echo "Type 0 to exit"
#MOD1
        echo "Type 1 for $MOD1"
#MOD2
        echo "Type 2 for $MOD2"
#MOD3
        echo "Type 3 for $MOD3"
###IF YOU ADD MODULE TO ZIP ADD ENTRY HERE AND BELOW
read -r choice
    case $choice in
    0)
        echo "---Exit---"
        exit
    ;;
    00)
        echo "---Switch Debug Zip---"
            if [ $ZIPLOG -eq "1" ]; then
                ZIPLOG=0
                echo "Zip debug switch is off"
            else
                ZIPLOG=1
                echo "Zip debug switch is on"
            fi
        menu
    ;;
    1)
        echo "---$MOD1 module selected---"
        MODULEZIP=$MOD1
        Zipping
    ;;
    2)
        echo "---$MOD2 module selected---"
        MODULEZIP=$MOD2
        Zipping
    ;;
    3)
        echo "---$MOD3 module selected---"
        MODULEZIP=$MOD3
        Zipping
    ;;
###IF YOU ADD MODULE TO ZIP ADD ENTRY HERE AND BELOW
esac
}
####################---Menu---#######################END

####################---ZIP-FUNCTION---#######################START
Zipping() {
cd $PATHGIT
CONF=$PATHGIT/$MODULEZIP/module.prop
source $CONF
if [ ! -d Releases/ ] | [ $(grep "$MODULEZIP") ]; then
echo "Zipping $MODULEZIP Module files"
else
echo "$MODULEZIP Module zip already there, so deleting the old ones"
rm -f Releases/$MODULEZIP*.zip
fi
cd $MODULEZIP
echo "Starting Zipping..."
if [ $ZIPLOG -eq "1" ]; then
zip -9 -r -v -T ../$MODULEZIP.zip .
mv ../$MODULEZIP.zip $PATHGIT/Releases/$MODULEZIP-V"$versionCode"-"$version".zip
else if [ $ZIPLOG -eq "0" ]; then
zip -9 -r -q -T ../$MODULEZIP.zip .
mv ../$MODULEZIP.zip $PATHGIT/Releases/$MODULEZIP-$( date +"%d%m%y-%H%M%S" ).zip
fi fi
echo "Finished Zipping..."
echo "Moving $MODULEZIP.zip into releases folder"
cd ../..
echo "Finished $MODULEZIP module zipping"
echo "Look for $MODULEZIP into $PATHGIT/Releases"
}
####################---ZIP-FUNCTION---#######################END
menu
if [ $ZIPLOG -eq "1" ]; then
menu
else if [ $ZIPLOG -eq "0" ]; then
exit
fi fi

