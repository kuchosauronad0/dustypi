NAME=dustypi
VERSION=0.0.5
# DEBEMAIL="andre.poley@mailbox.org"
# DEBFULLNAME="Andre Poley"

# Standard setup
mkdir $NAME-$VERSION
cd $NAME-$VERSION
dh_make --createorig --indep --copyright mit --yes
find debian -type f -not -regex 'debian/\(changelog\|compat\|rules\|control\|copyright\)' -exec rm {} \;
echo "./debian/source/* ./" > debian/$NAME.install
echo debian/source/manpages/dustypi.1 > debian/manpages

# Create directories
mkdir -p debian/source/usr/bin
mkdir -p debian/source/etc/dustypi
mkdir -p debian/source/lib/systemd/system
mkdir -p debian/source/manpages
# Add files
cp ../src/dustypi debian/source/usr/bin/dustypi
cp ../src/dustypi.conf debian/source/etc/dustypi/dustypi.conf
cp ../src/dustypi.service debian/source/lib/systemd/system/dustypi.service
cp ../src/dustypi.1 debian/source/manpages/dustypi.1
cp ../LICENSE debian/copyright
cp ../src/control debian/control

chmod +x debian/source/usr/bin/dustypi
chmod +x debian/source/lib/systemd/system/dustypi.service

# Standard finish
dpkg-buildpackage -uc -tc -rfakeroot

