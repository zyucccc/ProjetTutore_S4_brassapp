Insert into Utilisateur (nom, prenom, email, mdp, estAdmin) values ('Melenchon', 'JL', 'JL@gmail.com', 'parlementaire',0);
Insert into Utilisateur (nom, prenom, email, mdp, estAdmin) values ('Dupont', 'Jean', 'Inspiration@gmail.com', '1234',0);

Insert into TypeBiere(nomTypeBiere) values ('Ale');
Insert into TypeBiere(nomTypeBiere) values ('Lager');

Insert into Modele (demandeExport, numUtilisateur, numTypeBiere) values (0, 1, 1);
Insert into Modele (demandeExport, numUtilisateur, numTypeBiere) values (0, 1, 2);
Insert into Modele (demandeExport, numUtilisateur, numTypeBiere) values (0, 2, 1);

Insert into CourbeTheorique (MargeErreur, numModele) values (5, 1);
Insert into CourbeTheorique (MargeErreur, numModele) values (5, 2);
Insert into CourbeTheorique (MargeErreur, numModele) values (5, 3);

Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 0, 0, 1);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 2, 1, 1);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 4, 2, 1);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 6, 3, 1);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 6, 4, 1);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 18, 5, 1);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 20, 6, 1);

Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 0, 0, 2);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 1, 1, 2);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 1, 2, 2);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 2, 3, 2);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 2, 4, 2);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 3, 5, 2);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 3, 6, 2);

Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 0, 0, 3);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 2, 1, 3);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 2, 2, 3);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 8, 3, 3);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 10, 4, 3);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 18, 5, 3);
Insert into PointTheorique (valeurs, temps, numCourbeTheorique) values ( 20, 6, 3);

Insert into TypeMesure (nomTypeMesure, Unite) values ('Temperature', '°C');


Insert into CourbeMesuree (nomCourbeMesuree, dateDebut, dateFin, numCourbeTheorique, numTypemesure) values ('Temp1', SYSDATE(), SYSDATE(), 1, 1);
Insert into CourbeMesuree (nomCourbeMesuree, dateDebut, dateFin, numCourbeTheorique, numTypemesure) values ('Temp2', SYSDATE(), SYSDATE(), 2, 1);
Insert into CourbeMesuree (nomCourbeMesuree, dateDebut, dateFin, numCourbeTheorique, numTypemesure) values ('Temp3', SYSDATE(), SYSDATE(), 3, 1);

Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (0, 0, 1);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (2, 1, 1);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (3, 2, 1);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (6, 3, 1);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (7, 4, 1);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (15, 5, 1);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (20, 6, 1);

Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (0, 0, 3);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (2, 1, 3);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (3, 2, 3);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (10, 3, 3);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (15, 4, 3);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (15, 5, 3);
Insert into PointMesuree(valeurPointMesuree, tempsPointMesuree, numCourbeMesuree) values (20, 6, 3);