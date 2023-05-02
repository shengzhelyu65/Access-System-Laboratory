<?php
require_once 'Database.php';
if(isset($_GET['level'])) {
   $Level = 2; // get temperature value from HTTP GET
   $db = Database::getConnection();
        $query = $db->prepare('INSERT INTO users (Level) VALUES (:Level)');
        $result = $query->execute(
         [
            ':Level' => $Level
         ]
        );
   
   if ($result) {
      echo "New record created successfully";
   } else {
      echo "Error: " . $sql . " => " . $connection->error;
   }
} else {
   echo "User info is not set in the HTTP request";
}
?> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
   <h1>Hello World!</h1>
   <form method="$_GET">
      <button type="submit" name="level">Submit</button>
   </form>
</body>
</html>
