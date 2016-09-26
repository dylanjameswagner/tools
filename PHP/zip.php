<?php
/**
 * Zip files on server
 *
 * @usage /zip.php?source=uploads/2016&destination=uploads/2016.zip
 */

$source      = isset( $_GET['source'] )      ? $_GET['source']      : pathinfo( realpath( $file ), PATHINFO_DIRNAME ); // get the absolute path to $file
$destination = isset( $_GET['destination'] ) ? $_GET['destination'] : 'archive.zip';

function zip( $source, $destination ) {
	echo '<style>';
	echo 'th { text-align: left; }';
	echo '</style>';

	echo '<table>';
	echo '<tr><th>Source:</th><td>' . $source . '</td></tr>';
	echo '<tr><th>Destination:</th><td>' . $destination . '</td></tr>';
	echo '</table>';

	if ( ! extension_loaded( 'zip' ) || ! file_exists( $source ) ) {
		return false;
	}

	$zip = new ZipArchive();

	if ( ! $zip->open( $destination, ZIPARCHIVE::CREATE ) ) {
		return false;
	}

	$source = str_replace( '\\', '/', realpath( $source ) );

	if ( is_dir( $source ) === true ) {
		$files = new RecursiveIteratorIterator( new RecursiveDirectoryIterator( $source ), RecursiveIteratorIterator::SELF_FIRST );

		foreach ( $files as $file ) {
			$file = str_replace( '\\', '/', $file );

			// ignore "." and ".." folders
			if ( in_array( substr( $file, strrpos( $file, '/' ) + 1 ), array( '.', '..' ) ) ) {
				continue;
			}

			$file = realpath( $file );

			if ( is_dir( $file ) === true ) {
				// $zip->addEmptyDir( str_replace( $source . '/', '', $file . '/' ) );
				$res = $zip->addEmptyDir( str_replace( $source . '/', '', $file . '/' ) );
			}
			else if ( is_file( $file ) === true ) {
				// $zip->addFromString( str_replace( $source . '/', '', $file ), file_get_contents( $file ) );
				$res = $zip->addFromString( str_replace( $source . '/', '', $file ), file_get_contents( $file ) );
			}
		}
	}
	else if ( is_file( $source ) === true ) {
		// $zip->addFromString( basename( $source ), file_get_contents( $source ) );
		$res = $zip->addFromString( basename( $source ), file_get_contents( $source ) );
	}

	if ( $res === TRUE ) {
		echo "<em>$source</em> compressed to <em>$destination</em>.<br>";
	}
	else {
		echo "<em>$source</em> could not be compressed.<br>";
	}

	return $zip->close();
};

zip( $source, $destination ); // zip( '/folder/to/compress/', './compressed.zip' );
