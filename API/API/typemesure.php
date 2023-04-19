<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once './config/database.php';
include_once './objects/typemesureO.php';


if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    
    $database = new database();
    
    $db = $database->getConnection();
    $typeM = new typemesureO($db);
    $stmt = $typeM->readAll();
    $num = $stmt->rowCount();
    
    if($num>0){
        $users_arr=array();
        
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            
            $user_item=array(
                "numTypeMesure" => $numTypeMesure,
                "nomTypeMesure" => $nomTypeMesure,
                "Unite" => $Unite
            );
            
            array_push($users_arr, $user_item);
        }
        
        http_response_code(200);
        
        echo json_encode($users_arr);
    }
    else
    {
        http_response_code(400);

        echo json_encode(array("message" => "Database is empty"));
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $database = new Database();
    $db = $database->getConnection();
    
    $typeM = new typemesureO($db);
    
    $data = json_decode(file_get_contents("php://input"));
    
    if(
        !empty($data->nomTypeMesure) &&
        !empty($data->Unite) 
        ){
            
            $typeM->nomTypeMesure = $data->nomTypeMesure;
            $typeM->Unite = $data->Unite;
            
            
            if($typeM->create()){
                
                http_response_code(201);
                
                echo json_encode(array("message" => "measure type was created."));
            }
            
            else{
                
                http_response_code(503);
                
                echo json_encode(array("message" => "Unable to create measure type."));
            }
    }
    
    else{
        
        http_response_code(400);
        
        echo json_encode(array("message" => "Unable to create measure type. Data is incomplete."));
    }
}
?>