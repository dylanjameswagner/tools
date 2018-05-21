<?php
/**
 * Triggers resend of Order emails
 *
 * @link https://enru.co.uk/2014/02/17/testing-woocommerce-emails/
 *
 * "Here’s a wee snippet of code that I’m using to send a test email on
 * WooCommerce using PHP on the CLI. It lets me see how the email is compiled
 * from the templates. The code sends the email to the order’s email address and
 * dumps the email contents."
 *
 * @instructions
 * 1. Place this file at the WordPress root.
 * 1. Find an order ID you would like to test.
 * 2. IMPORTANT Change order email to your developer email, restore the original email after testing.
 * 3. Browse to this file with an order ID to see the content and trigger an email send. /woo-email-test.php?order_id=15272
 */

// include WordPress' wp-load
include "./wp-load.php";

// verbose errors
ini_set( 'display_errors', 1 );
error_reporting( E_ALL );

// the order ID we're testing the email with
$order_id = $_REQUEST['order_id'] ? $_REQUEST['order_id'] : null; // reset to null when done

if ( $order_id ) :
	// the email we want to send
	// $email_class = 'WC_Email_New_Order';
	// $email_class = 'WC_Email_Cancelled_Order';
	// $email_class = 'WC_Email_Failed_Order';
	$email_class = 'WC_Email_Customer_On_Hold_Order';
	// $email_class = 'WC_Email_Customer_Processing_Order';
	// $email_class = 'WC_Email_Customer_Completed_Order';
	// $email_class = 'WC_Email_Customer_Refunded_Order';
	// $email_class = 'WC_Email_Customer_Invoice';
	// $email_class = 'WC_Email_Customer_Note';
	// $email_class = 'WC_Email_Customer_Reset_Password';
	// $email_class = 'WC_Email_Customer_New_Account';

	// load the WooCommerce Emails
	$wc_emails = new WC_Emails();
	$emails = $wc_emails->get_emails();

	// select the email we want & trigger it to send
	$new_email = $emails[ $email_class ];

	if ( false ) :
		// $new_email->trigger( $order_id );
	endif;

	// show the email content
	echo $new_email->get_content(); // may return error if trigger is not run
else :
	echo __( 'Please set an order ID. /woo-email-test.php?order_id=#####', 'carbon' );
endif;
