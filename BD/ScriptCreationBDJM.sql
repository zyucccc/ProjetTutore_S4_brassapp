Use Projet;

CREATE TABLE Utilisateur(
        numUtilisateur Int  Auto_increment  NOT NULL ,
        nom            Varchar (25) NOT NULL ,
        prenom         Varchar (30) NOT NULL ,
        email          Varchar (50) NOT NULL ,
        mdp            Varchar (25) NOT NULL,
        estAdmin bool not null default 0
	,CONSTRAINT Utilisateur_PK PRIMARY KEY (numUtilisateur)
)ENGINE=InnoDB;



CREATE TABLE TypeBiere(
        NumTypeBiere Int  Auto_increment  NOT NULL ,
        nomTypeBiere Varchar (5) NOT NULL
	,CONSTRAINT TypeBiere_PK PRIMARY KEY (NumTypeBiere)
)ENGINE=InnoDB;


CREATE TABLE Modele(
        numModele      Int  Auto_increment  NOT NULL ,
        demandeExport  Bool NOT NULL ,
        dateDemande datetime,
        numUtilisateur Int ,
        NumTypeBiere   Int NOT NULL
	,CONSTRAINT Modele_PK PRIMARY KEY (numModele)

	,CONSTRAINT Modele_Utilisateur_FK FOREIGN KEY (numUtilisateur) REFERENCES Utilisateur(numUtilisateur)
	,CONSTRAINT Modele_TypeBiere0_FK FOREIGN KEY (NumTypeBiere) REFERENCES TypeBiere(NumTypeBiere)
)ENGINE=InnoDB;


CREATE TABLE CourbeTheorique(
        numCourbeTheorique Int  Auto_increment  NOT NULL ,
        MargeErreur        Double NOT NULL ,
        numModele          Int
	,CONSTRAINT CourbeTheorique_PK PRIMARY KEY (numCourbeTheorique)

	,CONSTRAINT CourbeTheorique_Modele_FK FOREIGN KEY (numModele) REFERENCES Modele(numModele)
)ENGINE=InnoDB;


CREATE TABLE PointTheorique(
        numPoint           Int  Auto_increment  NOT NULL ,
        valeurs            Double NOT NULL ,
        temps              Double NOT NULL ,
        numCourbeTheorique Int NOT NULL
	,CONSTRAINT PointTheorique_PK PRIMARY KEY (numPoint)

	,CONSTRAINT PointTheorique_CourbeTheorique_FK FOREIGN KEY (numCourbeTheorique) REFERENCES CourbeTheorique(numCourbeTheorique)
)ENGINE=InnoDB;


CREATE TABLE TypeMesure(
        numTypeMesure Int  Auto_increment  NOT NULL ,
        nomTypeMesure Varchar (25) NOT NULL ,
        Unite         Varchar (15) NOT NULL
	,CONSTRAINT TypeMesure_PK PRIMARY KEY (numTypeMesure)
)ENGINE=InnoDB;

CREATE TABLE CourbeMesuree(
        numCourbeMesuree   Int  Auto_increment  NOT NULL ,
        nomCourbeMesuree   Varchar (50) NOT NULL ,
        dateDebut          Datetime NOT NULL ,
        dateFin            Datetime NOT NULL ,
        numCourbeTheorique Int,
        numTypeMesure      Int Not null,
        numUtilisateur Int
	,CONSTRAINT CourbeMesuree_PK PRIMARY KEY (numCourbeMesuree)
	,CONSTRAINT CourbeMesuree_CourbeTheorique_FK FOREIGN KEY (numCourbeTheorique) REFERENCES CourbeTheorique(numCourbeTheorique)
	,CONSTRAINT CourbeMesuree_TypeMesure_FK FOREIGN KEY (numTypeMesure) REFERENCES TypeMesure(numTypeMesure)
    ,CONSTRAINT CourbeMesuree_Utilisateur_FK FOREIGN KEY (numUtilisateur) REFERENCES Utilisateur(numUtilisateur)
)ENGINE=InnoDB;



CREATE TABLE PointMesuree(
        numPointMesuree    Int  Auto_increment  NOT NULL ,
        valeurPointMesuree Double NOT NULL ,
        tempsPointMesuree  Double NOT NULL ,
        numCourbeMesuree   Int NOT NULL 
	,CONSTRAINT PointMesuree_PK PRIMARY KEY (numPointMesuree)

	,CONSTRAINT PointMesuree_CourbeMesuree_FK FOREIGN KEY (numCourbeMesuree) REFERENCES CourbeMesuree(numCourbeMesuree)
)ENGINE=InnoDB;


CREATE TABLE ActiviteFaite(
        numActiviteFaite  Int  Auto_increment  NOT NULL ,
        nomActiviteFaite  Varchar (50) NOT NULL ,
        pageActiviteFaite Varchar (50) NOT NULL ,
        numUtilisateur    Int
	,CONSTRAINT ActiviteFaite_PK PRIMARY KEY (numActiviteFaite)

	,CONSTRAINT ActiviteFaite_Utilisateur_FK FOREIGN KEY (numUtilisateur) REFERENCES Utilisateur(numUtilisateur)
)ENGINE=InnoDB;