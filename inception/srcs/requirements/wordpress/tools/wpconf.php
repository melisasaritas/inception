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
define('DB_NAME', '{$db_name}');

/** MySQL database username */
define('DB_USER', '{$db_user}');

/** MySQL database password */
define('DB_PASSWORD', '{$db_password}');

/** MySQL hostname */
define('DB_HOST', '{$db_host}');

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
