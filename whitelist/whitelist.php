<?php
$current_data = file_get_contents("key.json");
$array_data = json_decode($current_data, true);
$key = $_GET["key"];
$encoded_key = hash("sha256", $key);
if(in_array("$encoded_key", $array_data)){
    echo "success";
}
else{
    echo "fail";
}
?>