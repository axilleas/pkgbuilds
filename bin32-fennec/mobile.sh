#!/bin/bash

pkgver="$1"
link="ftp://ftp.mozilla.org/pub/mozilla.org/mobile/releases/$pkgver/linux/en-US/fennec-$pkgver.en-US.linux-i686.checksums"
path="/home/bukowski/aur/bin32-fennec/PKGBUILD"
sha="SHA1SUMS-$pkgver"


echo "Downloading sha..."
echo
wget $link >& /dev/null
mv fennec-$pkgver.en-US.linux-i686.checksums SHA1SUMS-$pkgver

if [ -f $sha ]; then

# Defining variables
newsha=`grep bz2 $sha | awk {'print $1'}`
oldsha=`grep sha512sums $path | cut -c 14-141`

# pkg version
oldpkgver=`grep pkgver $path | head -n1 | cut -c 8-13` 


echo "Changing pkgver..."
sed -i "s/$oldpkgver/$pkgver/" $path
sleep 1

echo "Changing sha512sums..."
sed -i "s/$oldsha/$newsha/" $path 
echo "# old sha512sum : $oldsha "
echo "# new sha512sum : $newsha "  
sleep 1
echo
echo "Making source package..."
makepkg -f --source
echo
echo "Uploading to AUR in 5 ..."
sleep 1
echo "Uploading to AUR in 4 ..."
sleep 1
echo "Uploading to AUR in 3 ..."
sleep 1
echo "Uploading to AUR in 2 ..."
sleep 1
echo "Uploading to AUR in 1 ..."
sleep 1
burp bin32-fennec-$pkgver-1.src.tar.gz
echo
echo "Upload complete."
echo
fi

rm $sha
rm bin32-fennec-$pkgver-1.src.tar.gz
