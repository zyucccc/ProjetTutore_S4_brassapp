<?php
class typemesureO{
  
    private $conn;
  
    public $numTypeMesure;
    public $nomTypeMesure;
    public $Unite;

    public function __construct($db){
        $this->conn = $db;
    }
    
    function readAll(){
        
        $query = "Select * from typemesure";
        
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        
        return $stmt;
    }
    
    function create(){
        
        $this->nom=htmlspecialchars(strip_tags($this->nomTypeMesure));
        $this->prenom=htmlspecialchars(strip_tags($this->Unite));

        
        $query = "Insert into TypeMesure (nomTypeMesure, Unite) values ('$this->nomTypeMesure', '$this->Unite')";
        
        $stmt = $this->conn->prepare($query);
        
        if($stmt->execute()){
            return true;
        }
        
        return false;
        
    }
}
?>