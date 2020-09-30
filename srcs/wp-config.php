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

// ** MySQL settings - You can get this info from your web host ** //cd
/** The name of the database for WordPress */
define( 'DB_NAME', 'BDD_Marion' );

/** MySQL database username */
define( 'DB_USER', 'mbelorge' );

/** MySQL database password */
define( 'DB_PASSWORD', 'mbelorge' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
# genere avec https://api.wordpress.org/secret-key/1.1/salt/
define('AUTH_KEY',         '~?}`Yk=ody5zBM[jl2#-H-+e3YM^v5Y5_o8YoN(_CTVOLGK%X~|iPfti0!!_++p/');
define('SECURE_AUTH_KEY',  'y:c%|n|z6eGDpA]+2k+qdg+W])o~+BF~S(N_eN=unZ8)~NGsUeOi,r}+u=#`Z&B-');
define('LOGGED_IN_KEY',    'ica1M<&+84RxDh>oDOq|BKs8+Qdd^RFj]Fn jdq3~FsdRnlfXn{?D0@#FtX+S+o%');
define('NONCE_KEY',        '^_*R1F23.-]@pq&C`-#gGx.YSj^pTo04<|*|p}cE1}01ZLI)[z!]xZ)<|2]J`MQD');
define('AUTH_SALT',        'm%W2u.kkB;=_Br%CC2^s3V|/yH3e(#Yg53Kg~){q8E`m(+QUvh0|WM>E&tG|FT:P');
define('SECURE_AUTH_SALT', '$ar|:gL*> #|n?CLUgZqMKGIQ`-_GKv)ddBrKl8tba0MQMa-GblBg8u;iW9Gg8c3');
define('LOGGED_IN_SALT',   ' X_0YR3WeT=-A1-;E}%Mkh:3:vP^[ss.K$;Gp (}k=me22JM]yIGl6U?j+Z9-fvr');
define('NONCE_SALT',       'jheTGq~sH&7,vc +uW@niTV&dm4s?iSfZ^j=|]9~ZeA*&uj2?q8ZADr&G^_L~]#w');

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
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
