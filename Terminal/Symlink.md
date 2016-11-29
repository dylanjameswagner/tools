## .bash_profile
`ln -s ../.bash_profile .bash_profile`

## woocommerce
`ln -s ../../plugins/woocommerce/templates woocommerce-reference`

## tribe events
`ln -s ../../plugins/the-events-calendar/src/views tribe-events-reference`
`cd tribe-events-reference`
`ln -s ../../../events-calendar-pro/src/views/pro pro`
### OR
`ln -s ../../plugins/the-events-calendar/src/views tribe-events-reference`
`ln -s ../../plugins/events-calendar-pro/src/views tribe-events-pro-reference`

## query monitor from wp-content
`ln -s ./plugins/query-monitor/wp-content/db.php db.php`

## symlink uploads to uploads
`ln -s ../../../example.com/wp-content/uploads uploads`
