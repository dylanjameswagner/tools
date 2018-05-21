<?php

function carbon_create_admin_account() {
	$username = 'username';
	$password = 'password';
	$email    = 'email@example.com';

	if ( ! username_exists( $username ) && ! email_exists( $email ) ) {
		$user = new WP_User( wp_create_user( $username, $password, $email ) );
		$user->set_role( 'administrator' );
	}
}
add_action( 'init', 'carbon_create_admin_account' );
