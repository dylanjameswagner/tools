<?php
$groups = acf_get_local_field_groups();
$json = [];

foreach ($groups as $group) {
    // Fetch the fields for the given group key
    $fields = acf_get_local_fields($group['key']);

    // Remove unecessary key value pair with key "ID"
    unset($group['ID']);

    // Add the fields as an array to the group
    $group['fields'] = $fields;

    // Add this group to the main array
    $json[] = $group;
}

$json = json_encode($json, JSON_PRETTY_PRINT);
// Optional - echo the JSON data to the page
echo "<pre>";
echo $json;
echo "</pre>";

// Write output to file for easy import into ACF.
// The file must be writable by the server process. In this case, the file is located in
// the current theme directory.
$file = get_template_directory() . '/acf-import.json';
file_put_contents($file, $json );
