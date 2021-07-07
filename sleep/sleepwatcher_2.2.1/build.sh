#!/bin/sh

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
echo '<plist version="1.0">'
echo '<dict>'
echo '	<key>KeepAlive</key>'
echo '	<true/>'
echo '	<key>Label</key>'
echo '	<string>com.icedman.wifi.sleepwatcher</string>'
echo '	<key>ProgramArguments</key>'
echo '	<array>'
echo '		<string>/usr/local/sbin/sleepwatcher</string>'
echo '		<string>-V</string>'
echo '		<string>-s /etc/icedman.wifi.sleep</string>'
echo '		<string>-w /etc/icedman.wifi.wake</string>'
echo '	</array>'
echo '	<key>RunAtLoad</key>'
echo '	<true/>'
echo '</dict>'
echo '</plist>'