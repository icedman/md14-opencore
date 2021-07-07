#!/bin/sh

./build.sh > sleepwatch.plist
sudo cp sleepwatcher /usr/local/sbin
sudo cp ./sleepwatch.plist /Library/LaunchDaemons/com.icedman.wifi.sleepwatcher.plist
sudo cp icedman* /etc
sudo chmod +x /etc/icedman*
sudo launchctl load /Library/LaunchDaemons/com.icedman.wifi.sleepwatcher.plist