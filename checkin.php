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
    $nama = $_GET['nama'];
    date_default_timezone_set("Asia/Bangkok");
    $check_in =date('h:i:sa');
    
    $check="select checkin from user where email='".$email."'";
    $rc=mysqli_query($conn, $check);
    $rowc=mysqli_fetch_row($rc);
    
    if($rowc[0] != 1)
    {
    $conn->query("insert into absen (email, nama, check_in, check_out, lama_kerja) values('".$email."','".$nama."','".$check_in."','Not Data','00:00:00')");
    $conn->query("update user set checkIn= 1 where email='".$email."'");
    }

?>