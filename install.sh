#!/bin/sh

set +x
sudo ./mount.sh
rm -rf /Volumes/EFI/EFI
cp -R ./EFI /Volumes/EFI/