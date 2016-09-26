```
sudo nano /etc/apache2/httpd.conf
sudo nano /etc/apache2/extra/httpd-userdir.conf
sudo nano /etc/apache2/users/djw.conf
```
```
sudo nano /etc/hosts
```
```
# VHX START
127.0.0.1 example.localhost
fe80::1%lo0 example.localhost
# VHX STOP
```
```
sudo nano /etc/apache2/extra/httpd-vhosts.conf
```
```
NameVirtualHost *:80

<Directory "/Users/djw/Sites/example.com/">
Allow From All
AllowOverride All
Options +Indexes
</Directory>
<VirtualHost *:80>
        ServerName "example.localhost"
        ServerAlias "example.localhost.*.*.*.*.xip.io"
        DocumentRoot "/Users/dylan/Sites/example.com"
</VirtualHost>
```
