<?php
// Read environment variables
$db_name = getenv('DB_NAME');
$db_user = getenv('DB_USER');
$db_password = getenv('DB_PASSWORD');
$db_host = getenv('DB_HOST');
$wp_url = getenv('WP_URL');
$wp_title = getenv('WP_TITLE');
$wp_admin_user = getenv('WP_ADMIN_USER');
$wp_admin_password = getenv('WP_ADMIN_PASSWORD');
$wp_admin_email = getenv('WP_ADMIN_EMAIL');

// Create wp-config.php content
$config_content = <<<EOD
<?php
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress_db');

/** MySQL database username */
define('DB_USER', 'msaritas');

/** MySQL database password */
define('DB_PASSWORD', '1234');

/** MySQL hostname */
define('DB_HOST', 'mariadb');

define( 'DB_CHARSET', 'utf8' );

define('DB_COLLATE', '' );

define('AUTH_KEY',         'yf2k[~%6Y-H}Nl>2ZD4t<+Rp#dD~ rO|sWl`Qal_m-APzz:-o{,G^/muMhCWF A;');
define('SECURE_AUTH_KEY',  'LP~SrjDmZ,u_-DJqV/l|iJC%PSsy)IkVK ETuVu&pn`AX%y]&UA38s0_5oTsAL C');
define('LOGGED_IN_KEY',    '0,5Mb_F%S=O~,N6-)-FirWRI vjc?eZ`kT5bA9|NE w0i.:k=ZPV5dl2~1#aj>xL');
define('NONCE_KEY',        'VUn1nnaf|=!7e{CpDi1=Lit8lNXlf#alX2q:G:xx0R|L04Jwy]6OXw7:||SkO#o=');
define('AUTH_SALT',        '8MULg1pe<5Wa^$?#G&7uw+Xr+:D4@M+|.eomTZ:jc+MHNI5c<H:+Ktk!1I36R#m*');
define('SECURE_AUTH_SALT', '3)kzM#]DGH(1<-Bx}Nl-#ry^dBfZuC=aV7NwC]y _8b:IsH3`2~[or%k d##@+5N');
define('LOGGED_IN_SALT',   '_ueBzx7hTm[O4a[cXWhy!_5K(Cv<*p&|(3UAA~+^m!!HB+^Y]]hHwVi]`$8EXA7h');
define('NONCE_SALT',       '?o2j|kHH.-tqJHIp00GYb#Rf.lA*^Q[+~0}/+j>1(&||>ST)o~+w,h=S/3;a.+n4');

\$table_prefix = 'wp_';

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
    define('ABSPATH', '/var/www/html/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
?>
EOD;

// Write the content to wp-config.php
file_put_contents('/var/www/html/wp-config.php', $config_content);

echo "wp-config.php has been generated.";
?>
