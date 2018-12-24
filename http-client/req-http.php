<?php
$ch = curl_init();
$url="http://i.http-mesh-test.weibo.com/";

// $proxy="10.211.55.5:8080";
// curl_setopt($ch, CURLOPT_PROXY, $proxy);

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_VERBOSE, 1);
curl_setopt($ch, CURLOPT_TIMEOUT,1);
echo curl_exec($ch);
curl_close($ch); 
