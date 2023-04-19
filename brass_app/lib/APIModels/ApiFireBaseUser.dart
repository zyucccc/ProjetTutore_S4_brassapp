import 'dart:convert';

ApiFireBaseUser apiFireBaseUserFromJson(String str) => ApiFireBaseUser.fromJson(json.decode(str));

String apiFireBaseUserToJson(ApiFireBaseUser data) => json.encode(data.toJson());

class ApiFireBaseUser {
  ApiFireBaseUser({
    this.nom,
    this.prenom,
    this.email,
    this.idFireBase,
    this.estAdmin,
  });

  String nom;
  String prenom;
  String email;
  String idFireBase;
  String estAdmin;

  factory ApiFireBaseUser.fromJson(Map<String, dynamic> json) => ApiFireBaseUser(
    nom: json["nom"] == null ? null : json["nom"],
    prenom: json["prenom"] == null ? null : json["prenom"],
    email: json["email"] == null ? null : json["email"],
    idFireBase: json["idFireBase"] == null ? null : json["idFireBase"],
    estAdmin: json["estAdmin"] == null ? null : json["estAdmin"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom == null ? null : nom,
    "prenom": prenom == null ? null : prenom,
    "email": email == null ? null : email,
    "idFireBase": idFireBase == null ? null : idFireBase,
    "estAdmin": estAdmin == null ? null : estAdmin,
  };
}