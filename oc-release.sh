#!/bin/sh

set +x
cp -R ./OpenCore/Release/X64/EFI/BOOT ./EFI/BOOT
cp -R ./OpenCore/Release/X64/EFI/OC/Drivers ./EFI/OC/
cp -R ./OpenCore/Release/X64/EFI/OC/Bootstrap ./EFI/OC/
cp -R ./OpenCore/Release/X64/EFI/OC/OpenCore.efi ./EFI/OC/
cp ./OpenCore/Drivers/* ./EFI/OC/Drivers/