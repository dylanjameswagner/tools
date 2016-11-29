## WooCommerce
__from theme__

    ln -s ../../plugins/woocommerce/templates woocommerce-reference

## The Events Calendar (tribe-events)
__from theme__

    ln -s ../../plugins/the-events-calendar/src/views tribe-events-reference

<!--break-->

    ln -s ../../plugins/events-calendar-pro/src/views tribe-events-pro-reference
    
<!--cd tribe-events-reference-->
<!--ln -s ../../../events-calendar-pro/src/views/pro pro-->

## Query Monitor
__from wp-content__

    ln -s ./plugins/query-monitor/wp-content/db.php db.php

## Uploads to Uploads
__from wp-content__

    ln -s ../../../example.com/wp-content/uploads uploads

## .bash_profile
__from subdirectory__

    ln -s ../.bash_profile .bash_profile
