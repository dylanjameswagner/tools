
sudo nano /etc/apache2/httpd.conf
sudo nano /etc/apache2/extra/httpd-userdir.conf
sudo nano /etc/apache2/users/djw.conf

sudo nano /etc/hosts

# VHX START
127.0.0.1 libbiemill.localhost
fe80::1%lo0 libbiemill.localhost
# VHX STOP

sudo nano /etc/apache2/extra/httpd-vhosts.conf

NameVirtualHost *:80

<Directory "/Users/djw/Sites/keywebdev.com/lm/">
Allow From All
AllowOverride All
Options +Indexes
</Directory>
<VirtualHost *:80>
        ServerName "libbiemill.localhost"
        ServerAlias "libbiemill.localhost.*.*.*.*.xip.io"
        DocumentRoot "/Users/djw/Sites/keywebdev.com/lm"
</VirtualHost>
