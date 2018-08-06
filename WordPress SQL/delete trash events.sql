-- select count trash events
SELECT COUNT(*)
FROM `wp_posts`
WHERE post_type = 'tribe_events'
AND post_status = 'trash'

-- delete trash events
DELETE
FROM wp_posts
WHERE post_type = 'tribe_events'
AND post_status = 'trash'

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
