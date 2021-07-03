#!/bin/sh

set +x
sudo ./mount.sh
rm -rf /Volumes/EFI-OSX/EFI
cp -R ./EFI /Volumes/EFI-OSX/
mv /Volumes/EFI-OSX/EFI/OC /Volumes/EFI-OSX/EFI/mac
rm -rf /Volumes/EFI-OSX/EFI/BOOT