<?php
class user{
  
    private $conn;
  
    public $id;
    public $nom;
    public $prenom;
    public $email;
    public $mdp;
  
    public function __construct($db){
        $this->conn = $db;
    }
    
    function readAll(){
        
        $query = "Select * from Utilisateur";
        
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        
        return $stmt;
    }
    
    function create(){
        
        $this->nom=htmlspecialchars(strip_tags($this->nom));
        $this->prenom=htmlspecialchars(strip_tags($this->prenom));
        $this->email=htmlspecialchars(strip_tags($this->email));
        $this->mdp=htmlspecialchars(strip_tags($this->mdp));
        
        $query = "Insert into Utilisateur (nom, prenom, email, mdp) values ('$this->nom', '$this->prenom', '$this->email', '$this->mdp')";
        
        $stmt = $this->conn->prepare($query);
        
        if($stmt->execute()){
            return true;
        }
        
        return false;
        
    }
}
?>