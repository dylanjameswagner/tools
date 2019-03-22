<?php
/**
 * @link https://pantheon.io/blog/moving-mysql-tables-myisam-innodb
 */
?>
<style>
.green { color: green; font-family: monospace;}
.red { color: red; font-family: monospace;}
</style>
<h1>Pantheon MyISAM to InnoDB engine converter</h1>

<?php
/*
 * Use this script ONLY if you are a Pantheon customer.
 * ONLY RUN THIS SCRIPT IN DEV!
 */
$mysqli = @new mysqli($_ENV['DB_HOST'] . ':' . $_ENV['DB_PORT'], $_ENV['DB_USER'], $_ENV['DB_PASSWORD'], $_ENV['DB_NAME']);
if ($mysqli->connect_errno) {
    echo "<h1>Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error ."</h1>\n";
    die(1);
}
$results = $mysqli->query("show tables;");
if ($results===false or $mysqli->connect_errno) {
    echo "<h1>MySQL error: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error ."</h1>\n";
    die(2);
}
while ($row= $results->fetch_assoc())
{
    $sql = "SHOW TABLE STATUS WHERE Name = '{$row['Tables_in_pantheon']}'";
    $thisTable = $mysqli->query($sql)->fetch_assoc();
    if ($thisTable['Engine']==='MyISAM') {
        $sql = "alter table " . $row['Tables_in_pantheon'] . " ENGINE = InnoDB;";
        echo $row['Tables_in_pantheon'] . " is using the " . $thisTable['Engine'] . " Engine. <span class='red'>[ Changing ]</span> <br />\n";
        $mysqli->query($sql);
    } else {
        echo $row['Tables_in_pantheon'] . ' is already using the ' . $thisTable['Engine'] . " Engine. <span class='green'>[ Ignoring ]</span> <br />\n";
    }
};
die(0);