<?php
session_start();
require "database.php";

//$userIDToken = $_POST["userIDToken"];
$userIDToken = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjI1OTM5NzFjYzRhMjExZWYwYzcwNmZjM2Q4MDg1ODBiMWI5ZTU0MjAifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXRfaGFzaCI6InRWN0g1WDJQdW4wbGYxMUlpam5NbUEiLCJhdWQiOiI5OTY0MTE1MTkyODAtaDUzc2hoZWgxZDJmaWE0aW52ZnF2OW11dnA5cnVpaDQuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDcwNjQ5NzQ1MDA4OTIyMDgyNDIiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXpwIjoiOTk2NDExNTE5MjgwLWg1M3NoaGVoMWQyZmlhNGludmZxdjltdXZwOXJ1aWg0LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiZW1haWwiOiJlbm9yc3dvQGdtYWlsLmNvbSIsImlhdCI6MTQ3MzA0NjUzMSwiZXhwIjoxNDczMDUwMTMxLCJuYW1lIjoiRXZhbiBOb3Jzd29ydGh5IiwicGljdHVyZSI6Imh0dHBzOi8vbGg2Lmdvb2dsZXVzZXJjb250ZW50LmNvbS8tMWRHM0NrU2NxRkEvQUFBQUFBQUFBQUkvQUFBQUFBQUFIc1UvLURZV3AzZEpiYm8vczk2LWMvcGhvdG8uanBnIiwiZ2l2ZW5fbmFtZSI6IkV2YW4iLCJmYW1pbHlfbmFtZSI6Ik5vcnN3b3J0aHkiLCJsb2NhbGUiOiJlbiJ9.YrbYjlEPDopQ905bPvWQvxTEFMRqFXV49t8BPi-TSzN2UhHW2ORAMrVaV7s_K6SaXpRI4A6MUDmV_SnS7WQlWxnytV5XB42Y0qnYjE1_QVuqgnye0_UkuHUXlLct0hqfuN_1LQ4_9rGqdlK-VNBI1ReZG3ImMkZRJsGyDHc1gs9w5TNRTmqOZAGXGiqeZDF0OsKj_xKIYrv5MJchmACXFr0chirf6JP78QCtxEonpmeG7rYIOrCZpYnIxqILHv2O0cPVN7ZWmfY4WWLWIBEU-0iXEopaXFpNQoGaeSI8rqobMGqh2btyRFlm97B_4F1iZCxkproVPuQKIy4u4sP7BQ";

$requestURL = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=$userIDToken";
$curl = curl_init($requestURL);
/*curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
curl_setopt($ch, CURLOPT_FORBID_REUSE, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Connection: Close'));*/
//curl_setopt($curl, CURLOPT_URL, $requestURL);
if(!($response = curl_exec($curl))) {
	echo curl_error($curl);
}
//$questTree["test"]["curl"] = json_encode($curl);
curl_close($curl);
//$response = http_get("https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=" . $userIDToken);
//print $response;
//$questTree["test"]["userIDToken"] = $userIDToken;
$test["response"] = $response;
//echo $test["requestURL"];
print json_encode($test["response"]);
//print " ";
//print $requestURL;

exit();
?>