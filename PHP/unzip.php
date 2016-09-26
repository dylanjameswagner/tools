<?php
/**
 * Unzip files on server
 *
 * @usage /unzip.php?source=uploads/2016.zip
 */
$source = isset( $_GET['source'] ) ? $_GET['source'] : 'archive.zip';
$destination = pathinfo( realpath( $source ), PATHINFO_DIRNAME ); // get the absolute path to $source

function unzip( $source, $destination ) {
	$zip = new ZipArchive;
	$res = $zip->open( $source );

	if ( $res === TRUE ) {
		$zip->extractTo( $destination ); // extract to $destination
		$zip->close();

		echo '<em>' . $source . '</em> extracted to <em>' . $destination . '</em>.';
	}
	else {
		echo '<em>' . $source . '</em> could not be extracted.';
	}
}
unzip( $source, $destination );
