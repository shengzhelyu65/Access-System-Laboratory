<?php
//Authentication information needed to connect with your database
$servername = "mysql.studev.groept.be";
$username = "a22-access6";
$dbname = "a22-access6";
$password = "VH7sgaEJ";
$api_key_value = "DaoBanMoJie_JiaIT";   //POST密匙
// 创建数据库连接
// Create a connection to your database
// ref: https://www.php.net/manual/en/pdo.construct.php
try {
    $conn = new PDO("mysql:host=$servername;dbname=$username", $username, $password);
} catch (PDOException $e) {
     //output an error in json format
    // ref: https://www.php.net/manual/en/function.json-encode
    $message = [ 'error' => 'unable to connect to db'];
    exit(json_encode($message));
}


if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    $level = $_POST["level"];
        $sql = "INSERT INTO User (UserLevel)
        VALUES ($level)";
        $result  = $conn->prepare($sql);
        $result ->execute( );

} 

else{
/** Print **/
//In this sample we will try to retrieve all persons born in a specific year.
// assume the requested url was : template.php?year=1992
// ref: https://www.php.net/manual/en/pdo.prepare
$sql = 'SELECT * FROM User';
$result  = $conn->prepare($sql);
$result ->execute( );
//return the data retrieved from the database as json.
// ref: https://www.php.net/manual/en/pdostatement.fetch.php
// ref: https://www.php.net/manual/en/pdostatement.fetchall.php
// echo json_encode( $statement->fetchAll(PDO::FETCH_ASSOC) );
$data=$result->fetchAll(PDO::FETCH_ASSOC);
// Check if data is not empty before creating the table
if (!empty($data)) {
    echo '<table>';  
    // Create the table header row
    echo '<thead><tr>';
    foreach ($data[0] as $key => $value) {
        echo '<th>' . $key . '</th>';
    }
    echo '</tr></thead>';

    // Create the table body rows
    echo '<tbody>';
    foreach ($data as $row) {
        echo '<tr>';
        foreach ($row as $value) {
            echo '<td>' . $value . '</td>';
        }
        echo '</tr>';
    }
    echo '</tbody>';

    echo '</table>';
} else {
    echo 'No data found.';
}
}
 
?>