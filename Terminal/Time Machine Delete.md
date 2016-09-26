# http://thegreyblog.blogspot.com/2014/03/shrink-your-time-machine-backups-and.html

tmutil listbackups

—-

sudo bash
for i in /Volumes/Time\ Machine\ Backups/Backups.backupdb/djw\'s\ MacBook\ Pro/2013-12-*; do tmutil delete "$i"; done

—-

disk util eject disk

—-

sudo hdiutil compact /Volumes/Time\ Capsule/djw\'s\ MacBook\ Pro.sparsebundle
sudo hdiutil compact -batteryallowed /Volumes/Time\ Capsule/djw\'s\ MacBook\ Pro.sparsebundle
