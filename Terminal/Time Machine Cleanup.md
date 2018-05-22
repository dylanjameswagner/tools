# Time Machube Cleanup
http://thegreyblog.blogspot.com/2014/03/shrink-your-time-machine-backups-and.html

	tmutil listbackups

<!--break-->

	sudo bash

<!--break-->

	for i in /Volumes/Time\ Machine\ Backups/Backups.backupdb/Dylan's\ 2013\ iMac/2018-02-*; do tmutil delete "$i"; done

<!--break-->

	disk util eject disk

# Compact sparsebundle Archive Size
Make sure the disk image is not mounted when executing this command

	sudo hdiutil compact /Volumes/Time\ Capsule/Dylan's\ 2013\ iMac.sparsebundle

<!--break-->

	sudo hdiutil compact -batteryallowed /Volumes/Time\ Capsule/Dylan's\ 2010\ MacBook\ Pro.sparsebundle
