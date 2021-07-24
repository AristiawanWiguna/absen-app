<?php

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
  header('Access-Control-Allow-Origin: *');
  header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
  header('Access-Control-Allow-Headers: token, Content-Type');
  header('Access-Control-Max-Age: 1728000');
  header('Content-Length: 0');
  header('Content-Type: text/plain');
  die();
}

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

$ret = [
  'result' => 'OK',
];
print json_encode($ret);

 
 $conn=new mysqli("localhost","root","","absen");
    
 if($conn){
 }
  else{
}

    $email = $_GET['email'];

    date_default_timezone_set("Asia/Bangkok");
    $check_out =date('h:i:sa');

    $check="select checkin from user where email='".$email."'";
    $rc=mysqli_query($conn, $check);
    $rowc=mysqli_fetch_row($rc);
    
    if($rowc[0] == 1)
    {
    $query = "select id, check_in from absen where email='".$email."' order by id desc limit 1";
    $result = mysqli_query($conn, $query);
    $row  = mysqli_fetch_row($result);
    $id = $row[0];

    $difftime = "select TIMEDIFF('".$check_out."','".$row[1]."') as timediff";
    $rt = mysqli_query($conn, $difftime);
    $rowt  = mysqli_fetch_row($rt);

    echo $rowt[0];
 
    $conn->query("update absen SET check_out='".$check_out."', lama_kerja='".$rowt[0]."' where id='".$id."'");
    $conn->query("update user set checkIn= 0 where email='".$email."'");


    }

?>