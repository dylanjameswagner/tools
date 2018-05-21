# WooCommerce (woocommerce)
_from theme_

    ln -s ../../plugins/woocommerce/templates woocommerce-reference

# The Events Calendar (tribe-events)
_from theme_

    ln -s ../../plugins/the-events-calendar/src/views tribe-events-reference && ln -s ../../plugins/events-calendar-pro/src/views/pro tribe-events-pro-reference

<!--break-->

    ln -s ../../plugins/the-events-calendar/src/views tribe-events-reference

<!--break-->

    ln -s ../../plugins/events-calendar-pro/src/views/pro tribe-events-pro-reference

<!--break-->

    cd tribe-events
    ln -s ../../../plugins/events-calendar-pro/src/views/pro pro-reference

# Query Monitor
_from wp-content_

    ln -s ./plugins/query-monitor/wp-content/db.php db.php

# Uploads to Uploads
_from wp-content_

    ln -s ../../../example.com/wp-content/uploads uploads

# .bash_profile
_from subdirectory_

    ln -s ../.bash_profile .bash_profile

# KSS to theme
_from siteroot_

    ln -s /wp-content/themes/sandsanderson/kss kss
