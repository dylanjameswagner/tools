-- find & replace domain
update wp_postmeta set meta_value = replace(meta_value, '//www.example.com', '//dev.example.com');
update wp_options set option_value = replace(option_value, '//www.example.com', '//dev.example.com');
update wp_posts set post_content = replace(post_content, '//www.example.com', '//dev.example.com');
update wp_posts set guid = replace(guid, '//www.example.com', '//dev.example.com');
