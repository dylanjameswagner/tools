-- select count of post_type
SELECT COUNT(*)
FROM `wp_posts`
WHERE `post_type` = 'post_type'

-- delete posts of post_type
DELETE
FROM `wp_posts`
WHERE `post_type` = 'post_type'

-- select count of orphaned postmeta
SELECT COUNT(*)
FROM `wp_postmeta`
LEFT JOIN `wp_posts` ON wp_posts.ID = wp_postmeta.post_id
WHERE wp_posts.ID IS NULL

-- delete orphaned postmeta
DELETE `wp_postmeta`
FROM `wp_postmeta`
LEFT JOIN `wp_posts` ON wp_posts.ID = wp_postmeta.post_id
WHERE wp_posts.ID IS NULL
