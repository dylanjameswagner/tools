# Time Machube Cleanup
http://thegreyblog.blogspot.com/2014/03/shrink-your-time-machine-backups-and.html

	tmutil listbackups

<!--break-->

	sudo bash

<!--break-->

	for i in /Volumes/Time\ Machine\ Backups/Backups.backupdb/Dylan\'s\ 2013\ iMac/2018-02-*; do tmutil delete "$i"; done

<!--break-->

	disk util eject disk

<!--break-->

	sudo hdiutil compact /Volumes/Time\ Capsule/djw\'s\ MacBook\ Pro.sparsebundle
	sudo hdiutil compact -batteryallowed /Volumes/Time\ Capsule/djw\'s\ MacBook\ Pro.sparsebundle
