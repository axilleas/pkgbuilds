#!/bin/bash

pkgver="$1"
link="ftp://ftp.mozilla.org/pub/firefox/releases/$pkgver/SHA1SUMS"
path="/home/bukowski/aur/firefox-beta-bin/PKGBUILD"
sha="SHA1SUMS-$pkgver"


echo "Downloading sha..."
echo
wget $link >& /dev/null
mv SHA1SUMS SHA1SUMS-$pkgver

if [ -f $sha ]; then

# Defining variables
newsha64=`grep -w "linux-x86_64/en-US/firefox-$pkgver.tar.bz2" $sha | awk 'NR==1{print $1}'`
newsha32=`grep -w "linux-i686/en-US/firefox-$pkgver.tar.bz2" $sha | awk 'NR==1{print $1}'`

oldsha64=`grep sha1sums $path | head -n1 | cut -c 12-51`
oldsha32=`grep sha1sums $path | tail -n1 | cut -c 42-81`

# pkg version
oldpkgver=`grep pkgver $path | head -n1 | cut -c 8-13` 


echo "Changing pkgver..."
sed -i "s/$oldpkgver/$pkgver/" $path
echo "# old pkgver: $oldpkgver"
echo "# new pkgver: $pkgver"
sleep 1

echo "Changing x86_64 sha1sums..."
sed -i "s/$oldsha64/$newsha64/" $path 
echo "# old sha1sum firefox-x86_64: $oldsha64 "
echo "# new sha1sum firefox-x86_64: $newsha64 "  
sleep 1
echo
echo "Changing i686 sha1sums..."
sed -i "s/$oldsha32/$newsha32/" $path 
echo "# old sha1sum firefox-i686: $oldsha32   "
echo "# new sha1sum firefox-i686: $newsha32   "
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
burp $(source PKGBUILD; echo ${pkgname}-${pkgver}-${pkgrel}.src.tar.gz) 
echo
echo "Upload complete."
echo

sleep 1
read -p "Do you want to build firefox-beta-bin-$pkgver and install it? [y/n]" install
	case $install in 
		[Yy]* ) echo "Cool, let's build it!"
				makepkg -fcsi
				;;

		[Nn]* ) echo "Ok, maybe another time."
				exit 1
				;;
		* )	echo "Answer y or n."
				;;
	esac

rm $sha
rm firefox-beta-bin-$pkgver-1.src.tar.gz
rm firefox-beta-bin-$pkgver-1-i686.pkg.tar.xz
rm firefox-$pkgver.tar.bz2

fi
