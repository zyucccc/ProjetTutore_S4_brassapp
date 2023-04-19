<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once './config/database.php';
include_once './objects/curve.php';
include_once './objects/point.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET')
{
    $database = new database();
    $db = $database->getConnection();
    
    $curve = new curve($db);
    
    $stmt = $curve->readPublic();
    $num = $stmt->rowCount();
    
    if($num>0){
        $modeles_arr=array();
        
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            
            $modeles_item=array(
                "numModele" => $numModele,
                "demandeExport" => $demandeExport,
                "dateDemande" => $dateDemande,
                "numTypeBiere" => $NumTypeBiere,
                "margeErreur" => $MargeErreur
            );
            
            $point = new point($db);
            $stmt = $point->readFromCurveT($numCourbeTheorique);
            
            $modeles_item['valeurs']=array();
            $modeles_item['temps']=array();
            $i = 0;
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                extract($row);
                
                $modeles_item['valeurs'][$i] = $valeurs;
                $modeles_item['temps'][$i] = $temps;
                $i++;
            }
            
            array_push($modeles_arr, $modeles_item);
        }
        
        http_response_code(200);
        
        echo json_encode($modeles_arr);
    }
    else
    {
        http_response_code(400);
        
        echo json_encode(array("message" => "Database is empty"));
    }
}

?>