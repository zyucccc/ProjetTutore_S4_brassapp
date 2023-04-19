
class APIUser {
  String numUtilisateur;
  String nom;
  String prenom;
  String email;

  APIUser({this.numUtilisateur, this.nom, this.prenom, this.email});

  APIUser.fromJson(Map<String, dynamic> json) {
    numUtilisateur = json['numUtilisateur'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numUtilisateur'] = this.numUtilisateur;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    return data;
  }
}