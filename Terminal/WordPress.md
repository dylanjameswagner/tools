#!bash/bin

Setup new WP install

==================
1. create location

cd ~/Sites

# OR

# wp sub dir
cd ~/Sites
mkdir PROJECT
cd PROJECT

================
2. get WordPress

wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm -rf latest.tar.gz

===================
3. rename directory

mv wordpress/ PROJECT

# OR

mv wordpress/ wp
cd wp
cp index.php ../index.php
cd ..
sed -ie "s/'\/wp-blog-header.php/'\/wp\/wp-blog-header.php/g" index.php
rm index.phpe

=====================
4. create vhost entry

MAMP Pro

OR

vhosts

==================
5. create database

phpMyAdmin

=======================
6. initialize WordPress

- go to PROJECT.local
- install wizard
- user colabadmin
- pass NEC229nec461

OR

- phpMyAdmin
- import database
- get existing wp-config.php

===============
7. open project

st3 .

=====================
8. open wp-config.php

st3 wp-config.php

OR

st3 wp/wp-config.php

======================================
9. edit wp-config.php database section
   replace DOMAIN.TLD with appropriate
   remove "/wp" and ".'/wp'" when not needed
   notice home and siteurl are hard coded on production and flexible elsewhere
   comment out the default WP_DEBUG

REPLACE

"
/** The name of the database for WordPress */
define('DB_NAME', 'DATABASE_NAME');

/** MySQL database username */
define('DB_USER', 'DATABASE_USER');

/** MySQL database password */
define('DB_PASSWORD', 'DATABASE_PASS');

/** MySQL hostname */
define('DB_HOST', 'DATABASE_HOST');
"

WITH

"

if ($_SERVER['HTTP_HOST'] == 'DOMAIN.TLD'
 || $_SERVER['HTTP_HOST'] == 'www.DOMAIN.TLD'
 || $_SERVER['HTTP_HOST'] == 'www.TEST.DOMAIN.TLD') :

	define('WP_HOME'		,'http://www.DOMAIN.TLD');
	define('WP_SITEURL'		,'http://www.DOMAIN.TLD/wp');

	define('DB_NAME'		,'DATABASE_NAME');
	define('DB_USER'		,'DATABASE_USER');
	define('DB_PASSWORD'	,'DATABASE_PASS');
	define('DB_HOST'		,'DATABASE_HOST');
	define('WP_DEBUG'		,false);

elseif ($_SERVER['HTTP_HOST'] == 'staging.DOMAIN.TLD'
	 || $_SERVER['HTTP_HOST'] == 'staging.TEST.DOMAIN.TLD') :

	define('WP_HOME'		,'http://'.$_SERVER['HTTP_HOST']);
	define('WP_SITEURL'		,'http://'.$_SERVER['HTTP_HOST'].'/wp');

	define('DB_NAME'		,'STAGING_DATABASE_NAME');
	define('DB_USER'		,'STAGING_DATABASE_USER');
	define('DB_PASSWORD'	,'STAGING_DATABASE_PASS');
	define('DB_HOST'		,'STAGING_DATABASE_HOST');
	define('WP_DEBUG'		,true);

elseif ($_SERVER['HTTP_HOST'] == 'DOMAIN.TLD.local') :

	define('WP_HOME'		,'http://'.$_SERVER['HTTP_HOST']);
	define('WP_SITEURL'		,'http://'.$_SERVER['HTTP_HOST'].'/wp');

	define('DB_NAME'		,'LOCAL_DATABASE_NAME');
	define('DB_USER'		,'LOCAL_DATABASE_USER');
	define('DB_PASSWORD'	,'LOCAL_DATABASE_PASS');
	define('DB_HOST'		,'LOCAL_DATABASE_HOST');
	define('WP_DEBUG'		,true);

else : // if all else fails try these settings

	define('WP_HOME'		,'http://'.$_SERVER['HTTP_HOST']);
	define('WP_SITEURL'		,'http://'.$_SERVER['HTTP_HOST'].'/wp');

	define('DB_NAME'		,'DATABASE_NAME');
	define('DB_USER'		,'DATABASE_USER');
	define('DB_PASSWORD'	,'DATABASE_PASS');
	define('DB_HOST'		,'DATABASE_HOST');
	define('WP_DEBUG'		,true);

endif;
"

=========================
10. remove unneeded themes
	consider leaving one default theme for testing

cd wp-content/themes

OR

cd wp/wp-content/themes

THEN

rm -rf twentyten twentyeleven twentytwelve twentythirteen twentyfourteen
rm -rf twentyfifteen

===============
11. clone Carbon

CHOOSE ONE

# curl -sL --user "USERNAME:PASSWORD" https://github.com/teamcolab/Carbon/archive/beta-v0.1.tar.gz > carbon.tar.gz
# curl -sL --user “dylanjameswagner:Ldw479#o<VhAnL3LQcPbXaCt" https://github.com/teamcolab/Carbon/archive/beta-v0.1.tar.gz > carbon.tar.gz

git clone git@github.com:teamcolab/Carbon.git
git clone --branch latest git@github.com:teamcolab/Carbon.git
git clone --branch latest file:///Users/dylan/Sites/carbon/wp/wp-content/themes/Carbon
git clone --branch latest /Users/dylan/Sites/carbon/wp/wp-content/themes/Carbon
git clone --branch latest ~/Sites/carbon/wp/wp-content/themes/Carbon

THEN

cd Carbon
rm -rf .git*
cd ..

==============================
12. duplicate or rename Carbon

cp -R Carbon THEME

OR

mv Carbon THEME


OPTIONAL - create symlink for reference

ln -s ~/Sites/carbon/wp/wp-content/themes/Carbon Carbon

==================================
13. initialize git at project root

cd ~/Sites/PROJECT

OR

cd ../..

THEN

echo "# PROJECT" >> README.md

git init

touch .gitignore
st3 .gitignore

THEN

"
###
### everything
###

/*

###
### root
###

!.git*
!.htaccess
!README.md
!wp-config.php

###
### favicons
###

!favicon*
!apple-touch-icon*
!android-chrome*
!browserconfig.xml
!manifest.json
!mstile*

###
### wp-content
###

!wp-content/
wp-content/*

###
### plugins
###

!wp-content/plugins/
wp-content/plugins/*
# !wp-content/plugins/advanced-custom-fields/

###
### themes
###

!wp-content/themes/
wp-content/themes/*
!wp-content/themes/concordia/

###
### General ignore
###

.sass-cache

###
### OS Generated
###

._*
.orig
.DS_Store*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
"

THEN

git add/commit

THEN

git remote add origin git@github.com:teamcolab/Concordia-Group.git
git push -u origin master

===========================
13. install npm, gulp build
	(in theme dir)

CHOOSE

cd THEME
cd ~/Sites/PROJECT/wp-content/themes/THEME
cd ~/Sites/PROJECT/wp/wp-content/themes/THEME

THEN

npm install
gulp build

==============================
14. gulp watch for live reload
	(in theme dir)

gulp watch
