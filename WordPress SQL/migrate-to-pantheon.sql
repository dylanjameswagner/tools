-- WordPress
RENAME table `abc123_commentmeta` TO `wp_commentmeta`;
RENAME table `abc123_comments` TO `wp_comments`;
RENAME table `abc123_links` TO `wp_links`;
RENAME table `abc123_options` TO `wp_options`;
RENAME table `abc123_postmeta` TO `wp_postmeta`;
RENAME table `abc123_posts` TO `wp_posts`;
RENAME table `abc123_terms` TO `wp_terms`;
RENAME table `abc123_termmeta` TO `wp_termmeta`;
RENAME table `abc123_term_relationships` TO `wp_term_relationships`;
RENAME table `abc123_term_taxonomy` TO `wp_term_taxonomy`;
RENAME table `abc123_usermeta` TO `wp_usermeta`;
RENAME table `abc123_users` TO `wp_users`;

-- Gravity Forms
RENAME table `abc123_rg_form` TO `wp_rg_form`;
RENAME table `abc123_rg_form_meta` TO `wp_rg_form_meta`;
RENAME table `abc123_rg_form_view` TO `wp_rg_form_view`;
RENAME table `abc123_rg_incomplete_submissions` TO `wp_rg_incomplete_submissions`;
RENAME table `abc123_rg_lead` TO `wp_rg_lead`;
RENAME table `abc123_rg_lead_detail` TO `wp_rg_lead_detail`;
RENAME table `abc123_rg_lead_detail_long` TO `wp_rg_lead_detail_long`;
RENAME table `abc123_rg_lead_meta` TO `wp_rg_lead_meta`;
RENAME table `abc123_rg_lead_notes` TO `wp_rg_lead_notes`;

-- EWWW Image Optimizer
RENAME table `abc123_ewwwio_images` TO `wp_ewwwio_images`;

-- live to Pantheon dev
update wp_postmeta set meta_value = replace(meta_value, '//example.com', '//dev-example.pantheonsite.io');
update wp_options set option_value = replace(option_value, '//example.com', '//dev-example.pantheonsite.io');
update wp_posts set post_content = replace(post_content, '//example.com', '//dev-example.pantheonsite.io');
update wp_posts set guid = replace(guid, '//example.com', '//dev-example.pantheonsite.io');

update wp_postmeta set meta_value = replace(meta_value, '//www.example.com', '//dev-example.pantheonsite.io');
update wp_options set option_value = replace(option_value, '//www.example.com', '//dev-example.pantheonsite.io');
update wp_posts set post_content = replace(post_content, '//www.example.com', '//dev-example.pantheonsite.io');
update wp_posts set guid = replace(guid, '//www.example.com', '//dev-example.pantheonsite.io');

-- Rackspace dev to Pantheon dev
update wp_postmeta set meta_value = replace(meta_value, '//dev.example.com.php56-24.ord1-1.websitetestlink.com', '//dev-example.pantheonsite.io');
update wp_options set option_value = replace(option_value, '//dev.example.com.php56-24.ord1-1.websitetestlink.com', '//dev-example.pantheonsite.io');
update wp_posts set post_content = replace(post_content, '//dev.example.com.php56-24.ord1-1.websitetestlink.com', '//dev-example.pantheonsite.io');
update wp_posts set guid = replace(guid, '//dev.example.com.php56-24.ord1-1.websitetestlink.com', '//dev-example.pantheonsite.io');

-- local to dev
update wp_postmeta set meta_value = replace(meta_value, '//example.com.local:8888', '//dev-example.pantheonsite.io');
update wp_options set option_value = replace(option_value, '//example.com.local:8888', '//dev-example.pantheonsite.io');
update wp_posts set post_content = replace(post_content, '//example.com.local:8888', '//dev-example.pantheonsite.io');
update wp_posts set guid = replace(guid, '//example.com.local:8888', '//dev-example.pantheonsite.io');

-- subdir dev to root dev - remove wp
update wp_postmeta set meta_value = replace(meta_value, '//dev-example.pantheonsite.io/wp/', '//dev-example.pantheonsite.io/');
update wp_options set option_value = replace(option_value, '//dev-example.pantheonsite.io/wp/', '//dev-example.pantheonsite.io/');
update wp_posts set post_content = replace(post_content, '//dev-example.pantheonsite.io/wp/', '//dev-example.pantheonsite.io/');
update wp_posts set guid = replace(guid, '//dev-example.pantheonsite.io/wp/', '//dev-example.pantheonsite.io/');

-- live to local
update wp_postmeta set meta_value = replace(meta_value, '//www.example.com', '//example.com.local:8888');
update wp_options set option_value = replace(option_value, '//www.example.com', '//example.com.local:8888');
update wp_posts set post_content = replace(post_content, '//www.example.com', '//example.com.local:8888');
update wp_posts set guid = replace(guid, '//www.example.com', '//example.com.local:8888');

-- test for anything missed
SELECT * FROM `wp_postmeta` WHERE `meta_value` LIKE '%example.com%'
SELECT * FROM `wp_options` WHERE `option_value` LIKE '%example.com%'
SELECT * FROM `wp_posts` WHERE `post_content` LIKE '%example.com%'

-- search db for broken meta_key
SELECT * FROM `wp_options` WHERE `option_name` LIKE '%abc123_%'
SELECT * FROM `wp_usermeta` WHERE `meta_key` LIKE '%abc123_%'

-- update meta_key created from previous SELECT results
UPDATE `pantheon`.`wp_usermeta` SET `meta_key` = 'wp_capabilities' WHERE `wp_usermeta`.`umeta_id` = 10;

update wp_options set option_name = replace(option_name, 'abc123_user_roles', 'wp_user_roles');

update wp_usermeta set meta_key = replace(meta_key, 'abc123_capabilities', 'wp_capabilities');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user_level', 'wp_user_level');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_dashboard_quick_press_last_post_id', 'wp_dashboard_quick_press_last_post_id');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user', 'wp_user');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user', 'wp_user');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_capabilities', 'wp_capabilities');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user_level', 'wp_user_level');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_capabilities', 'wp_capabilities');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user_level', 'wp_user_level');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_capabilities', 'wp_capabilities');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user_level', 'wp_user_level');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_capabilities', 'wp_capabilities');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user_level', 'wp_user_level');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_dashboard_quick_press_last_post_id', 'wp_dashboard_quick_press_last_post_id');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_media_library_mode', 'wp_media_library_mode');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_dashboard_quick_press_last_post_id', 'wp_dashboard_quick_press_last_post_id');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user', 'wp_user');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_user', 'wp_user');
update wp_usermeta set meta_key = replace(meta_key, 'abc123_yoast_notification', 'wp_yoast_notification');
