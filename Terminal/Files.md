# Edit Hosts

        sudo nano /etc/apache2/httpd.conf
        sudo nano /etc/apache2/extra/httpd-userdir.conf
        sudo nano /etc/apache2/users/dylan.conf
        sudo nano /etc/hosts

# VHX START

        127.0.0.1 libbiemill.localhost
        fe80::1%lo0 libbiemill.localhost

# VHX STOP

        sudo nano /etc/apache2/extra/httpd-vhosts.conf

# Virtual Host

        NameVirtualHost *:80

        <Directory "/Users/dylan/Sites/example.com/">
        Allow From All
        AllowOverride All
        Options +Indexes
        </Directory>
        <VirtualHost *:80>
                ServerName "example.com.local"
                ServerAlias "example.com.local.*.*.*.*.xip.io"
                DocumentRoot "/Users/dylan/Sites/example.com"
        </VirtualHost>
