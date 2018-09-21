<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

if ( file_exists( dirname( __FILE__ ) . '/wp-config-local.php' ) ) :

	require_once( dirname( __FILE__ ) . '/wp-config-local.php' );

else :

	// ** MySQL settings - You can get this info from your web host ** //
	if ( $_SERVER['HTTP_HOST'] == 'example.com'
	  || $_SERVER['HTTP_HOST'] == 'www.example.com'
	  || $_SERVER['HTTP_HOST'] == 'www.example.com.hostingtestlink.com'
	  || $_SERVER['HTTP_HOST'] == 'www.example.com.hostingtestlink.com' ) :

		define('DB_NAME',     'database_name_here');
		define('DB_USER',     'username_here');
		define('DB_PASSWORD', 'password_here');
		define('DB_HOST',     'localhost');

	elseif ( $_SERVER['HTTP_HOST'] == 'test.example.com'
		  || $_SERVER['HTTP_HOST'] == 'test.example.com.hostingtestlink.com' ) :

		define('DB_NAME',     'database_name_here');
		define('DB_USER',     'username_here');
		define('DB_PASSWORD', 'password_here');
		define('DB_HOST',     'localhost');

	elseif ( $_SERVER['HTTP_HOST'] == 'dev.example.com'
		  || $_SERVER['HTTP_HOST'] == 'dev.example.com.hostingtestlink.com' ) :

		define('DB_NAME',     'database_name_here');
		define('DB_USER',     'username_here');
		define('DB_PASSWORD', 'password_here');
		define('DB_HOST',     'localhost');

	else :

		/** The name of the database for WordPress */
		define('DB_NAME', 'database_name_here');

		/** MySQL database username */
		define('DB_USER', 'username_here');

		/** MySQL database password */
		define('DB_PASSWORD', 'password_here');

		/** MySQL hostname */
		define('DB_HOST', 'localhost');

	endif;

	/**
	 * Define WP_HOME && WP_SITEURL based on environment
	 *
	 * Also handles HTTPS and WWW redirect.
	 */
	if ( $_SERVER['HTTP_HOST'] == 'example.com'
	  || $_SERVER['HTTP_HOST'] == 'www.example.com'
	  || $_SERVER['HTTP_HOST'] == 'www.example.com.hostingtestlink.com' ) :
		define( 'WP_HOME',    'https://www.example.com' );
		define( 'WP_SITEURL', 'https://www.example.com' );
	else :
		define( 'WP_HOME',    'http://' . $_SERVER['HTTP_HOST'] );
		define( 'WP_SITEURL', 'http://' . $_SERVER['HTTP_HOST'] );
	endif;

endif;

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
if ( $_SERVER['HTTP_HOST'] == 'example.com'
  || $_SERVER['HTTP_HOST'] == 'www.example.com'
  || $_SERVER['HTTP_HOST'] == 'www.example.com.hostingtestlink.com'
  || $_SERVER['HTTP_HOST'] == 'test.example.com'
  || $_SERVER['HTTP_HOST'] == 'test.example.com.hostingtestlink.com' ) :

	define('WP_DEBUG',         true);
	define('WP_DEBUG_LOG',     true);
	define('WP_DEBUG_DISPLAY', false);

else :

	define('WP_DEBUG',         true);
	define('WP_DEBUG_LOG',     true);
	define('WP_DEBUG_DISPLAY', true);

endif;

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
