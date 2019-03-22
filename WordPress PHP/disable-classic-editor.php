<?php
/**
 * Disable the Block Editor
 */
add_filter( 'use_block_editor_for_post', '__return_false' );

add_filter( 'use_block_editor_for_post_type', '__return_false' );

/**
 * Disable the Block Editor
 */
add_filter( 'use_block_editor_for_post_type', 'colab_use_block_editor_for_post_type' );
function colab_use_block_editor_for_post_type( $use_block_editor ) {
	return false;
}

/**
 * Disable the Block Editor on Specific Type
 */
add_filter( 'use_block_editor_for_post_type', 'colab_use_block_editor_for_post_type', 10, 2 );
function colab_use_block_editor_for_post_type( $use_block_editor, $post_type ) {

	if ( in_array( $post_type, [
		'post',
		'my-custom-type',
		'second-type',
	] ) ) {
		return false;
	}
	return $use_block_editor;
}
