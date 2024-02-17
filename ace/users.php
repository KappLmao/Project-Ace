<?php
include "headers.php";

class User
{
    function login($json)
    {
        include "connection.php";
        //{"username":"00-099-F", "password":"phinma-coc-cite"}

        $json = json_decode($json, true);
        $userId = $json["username"];
        $password = $json["password"];

        $sql = "SELECT * FROM tbl_users WHERE username = :userId AND password = :password";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":userId", $userId);
        $stmt->bindParam(":password", $password);
        $returnValue = 0;

        if ($stmt->execute()) {
            if ($stmt->rowCount() > 0) {
                $rs = $stmt->fetch(PDO::FETCH_ASSOC);
                $returnValue = json_encode($rs);
            }
        }
        return $returnValue;
    }
} //User



$json = isset($_POST["json"]) ? $_POST["json"] : "0";
$operation = isset($_POST["operation"]) ? $_POST["operation"] : "0";
$user = new User();

switch ($operation) {
    case "login":
        echo $user->login($json);
        break;
}
