## Apache
```
http -v
sudo apachectl start
sudo apachectl restart
sudo apachectl stop
```

```
sudo nano /private/etc/hosts
```

## dos2unix
```
for file in `find . -type f`; do dos2unix $file $file; done
```

---

## mysql
```
/usr/local/mysql/bin/mysql -v
sudo /usr/local/mysql/support-files/mysql.server start
```

---

## Change dir
`cd`
## List dir contents
`ls`
## List dir contents and permissions
`ls -l`
## List all the files in a directory.
`ls -la`

---

## ???
sudo nano /private/etc/hosts

ifconfig

---

## Merge ._ files
```
dot_clean -vm .
```

## List file by name ( and remove )
```
find . -name '.DS_Store' -print -exec rm {} \;
find . -name 'Thumbs.db' -print -exec rm {} \;

find . -name 'dwsync.xml' -print -exec rm –Rf {} \;
find . -name '_notes' -print -exec rm -Rf {} \;
```

## Remove .svn garbage from the Dev servers:
```
find . -name '*.svn' -print -exec rm –Rf {} \;
find . -name '.DS_Store' -print -exec rm –Rf {} \;
find . -name 'dwsync.xml' -print -exec rm –Rf {} \;
find . -name '_notes' -print -exec rm -f {} \;
```

## Find files that have been changed in the last n days. Useful for when you need to figure out what you or others may have edited recently like in the past ‘14’ days:
```
find . -mtime -14 –type f -print
```

---

## For unlocking files on a smb mounted drive:
`chflags -R nouchg ./`

---

## pipe any text output to the mac clipboard for easy pasting:
`find . -mtime -14 –type f -print | pbcopy`

## Read up on it:
`man pbcopy`

---

## Refresh Open with Dialog
`/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user`
