chflags nohidden ~/Library/
chflags hidden ~/Library/

gulp js
sudo npm install --global gulp

bower js
sudo npm install -g bower

bower install neat --save-dev

————————————————————————————————————————————————

1. create Sites dir

cd YourSitesDirectory
mkdir YourProjectDirectory

or

Finder


2. create vhost entry

MAMP Pro


3. create database

phpMyAdmin


4. get WordPress

wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm -rf latest.tar.gz
mv wordpress/ wp
cd wp
cd ..
echo "<?php
/**
 * Front to the WordPress application. This file doesn't do anything, but loads
 * wp-blog-header.php which does and tells WordPress to load the theme.
 *
 * @package WordPress
 */

/**
 * Tells WordPress to load the WordPress theme and output it.
 *
 * @var bool
 */
define('WP_USE_THEMES', true);

/** Loads the WordPress Environment and Template */
require( dirname( __FILE__ ) . '/wp/wp-blog-header.php' );" >> index.php


5. install WordPress

go to .local, install wizard


6. set url based on host in wp-config, AFTER prefix

/**
 * Set url based on request for dev purposes
 */
define( 'WP_SITEURL', 'http://' . $_SERVER['HTTP_HOST'] . '/wp' );
define( 'WP_HOME', 'http://' . $_SERVER['HTTP_HOST'] );


7. remove default themes

cd ~/YourSitesDirectory/YourProjectDirectory/wp/wp-content/themes
rm -rf twentytwelve
rm -rf twentythirteen
rm -rf twentyfourteen
rm -rf twentyfifteen


8. clone Carbon

// curl -sL --user "USERNAME:PASSWORD" https://github.com/teamcolab/Carbon/archive/beta-v0.1.tar.gz > carbon.tar.gz
// curl -sL --user “dylanjameswagner:Ldw479#o<VhAnL3LQcPbXaCt" https://github.com/teamcolab/Carbon/archive/beta-v0.1.tar.gz > carbon.tar.gz

git clone git@github.com:teamcolab/Carbon.git

9. duplicate Carbon dir and rename to match client

Finder

OPTIONAL. create symlink to reference themes

ln -s /Users/dylan/Sites/lyttleco.com/wp/wp-content/themes/lyttleco lyttleco


10. install nom, gulp build (in theme dir)

npm install
gulp build


11. golp watch for live reload (in theme dir)

gulp watch

