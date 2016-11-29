## woocommerce
__from theme__

    ln -s ../../plugins/woocommerce/templates woocommerce-reference

## tribe events
__from theme__

    ln -s ../../plugins/the-events-calendar/src/views tribe-events-reference

<!--break-->

    ln -s ../../plugins/events-calendar-pro/src/views tribe-events-pro-reference
    
<!--cd tribe-events-reference-->
<!--ln -s ../../../events-calendar-pro/src/views/pro pro-->

## query monitor
__from wp-content__

    ln -s ./plugins/query-monitor/wp-content/db.php db.php

## symlink uploads to uploads
__from wp-content__

    ln -s ../../../example.com/wp-content/uploads uploads

## .bash_profile
__from subdirectory__

    ln -s ../.bash_profile .bash_profile
