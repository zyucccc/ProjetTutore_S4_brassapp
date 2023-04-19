<?php

class curve{
    
    private $conn;
    
    public function __construct($db){
        $this->conn = $db;
    }
    
    function readPublic(){
        
        $query = "Select * from Modele natural join CourbeTheorique where numUtilisateur is null";
        
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        
        return $stmt;
    }
    
    function readCurve($numCT)
    {
        $query = "Select * from PointTheorique where numCourbeTheorique = '$numCT'";
        
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        
        return $stmt;
    }
}

?>