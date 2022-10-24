<?php
function openURL($url) {
 
  // Create a new cURL resource
  $ch = curl_init();
 
  // Set the file URL to fetch through cURL
  curl_setopt($ch, CURLOPT_URL, $url);
 
  // Do not check the SSL certificates
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
 
  // Return the actual result of the curl result instead of success code
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_HEADER, 0);
  $data = curl_exec($ch);
  curl_close($ch);
  return $data;
}

	echo openURL('https://discord.gg/esn6q3BbV2');
?>