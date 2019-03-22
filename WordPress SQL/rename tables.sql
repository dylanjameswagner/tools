-- live to local
update wp_postmeta set meta_value = replace(meta_value, '//www.example.com', '//example.com.local:8888');
update wp_options set option_value = replace(option_value, '//www.example.com', '//example.com.local:8888');
update wp_posts set post_content = replace(post_content, '//www.example.com', '//example.com.local:8888');
update wp_posts set guid = replace(guid, '//www.example.com', '//example.com.local:8888');

-- local to dev
update wp_postmeta set meta_value = replace(meta_value, '//example.com.local:8888', '//dev-example.pantheonsite.io');
update wp_options set option_value = replace(option_value, '//example.com.local:8888', '//dev-example.pantheonsite.io');
update wp_posts set post_content = replace(post_content, '//example.com.local:8888', '//dev-example.pantheonsite.io');
update wp_posts set guid = replace(guid, '//example.com.local:8888', '//dev-example.pantheonsite.io');

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

RENAME table `abc123_rg_form` TO `wp_rg_form`;
RENAME table `abc123_rg_form_meta` TO `wp_rg_form_meta`;
RENAME table `abc123_rg_form_view` TO `wp_rg_form_view`;
RENAME table `abc123_rg_incomplete_submissions` TO `wp_rg_incomplete_submissions`;
RENAME table `abc123_rg_lead` TO `wp_rg_lead`;
RENAME table `abc123_rg_lead_detail` TO `wp_rg_lead_detail`;
RENAME table `abc123_rg_lead_detail_long` TO `wp_rg_lead_detail_long`;
RENAME table `abc123_rg_lead_meta` TO `wp_rg_lead_meta`;
RENAME table `abc123_rg_lead_notes` TO `wp_rg_lead_notes`;

RENAME table `abc123_redirection_404` TO `wp_redirection_404`;
RENAME table `abc123_redirection_groups` TO `wp_redirection_groups`;
RENAME table `abc123_redirection_items` TO `wp_redirection_items`;
RENAME table `abc123_redirection_logs` TO `wp_redirection_logs`;

RENAME table `abc123_ewwwio_images` TO `wp_ewwwio_images`;

-- search db for broken meta_key
SELECT * FROM `wp_options` WHERE `option_name` LIKE '%abc123_%'
SELECT * FROM `wp_usermeta` WHERE `meta_key` LIKE '%abc123_%'

-- update meta_key
UPDATE `database_name`.`wp_usermeta` SET `meta_key` = 'wp_capabilities' WHERE `wp_usermeta`.`umeta_id` = 10;
