-- @link https://support.advancedcustomfields.com/forums/topic/changing-field-name-question/
-- "You can always edit your database and change all the meta_key references from {old_name} to {new_name}."

UPDATE wp_postmeta
SET meta_key='new_name'
where meta_key='old_name';

UPDATE wordpress.wp_postmeta
SET meta_key='_new_name'
where meta_key='_old_name';
