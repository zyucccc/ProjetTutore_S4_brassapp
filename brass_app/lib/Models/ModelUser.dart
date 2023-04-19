
class ModelUser {
  num id;
  String lastname;
  String firstname;
  String password;
  String email;
  bool isAdmin;

  ModelUser.c1(int id){
    this.id = id;
  }

  ModelUser.c2(String email, String password){
    this.email = email;
    this.password = password;
  }

  ModelUser.c3(String email, String password, String lastname, String firstname) {
    this.email=email;
    this.password=password;
    this.lastname=lastname;
    this.firstname=firstname;
  }


  //getters et setters


  set setId(int id) {
    this.id = id;
  }

  int get getId {
    return id;
  }

  String get getEmail {
    return email;
  }

  set setEmail(String email) {
    this.email = email;
  }

  bool get getIsAdmin {
    return isAdmin;
  }

  set setIsAdmin(bool isAdmin) {
    this.isAdmin = isAdmin;
  }

  String get getFirstname {
    return firstname;
  }

  set setFirstname(String firstname) {
    this.firstname = firstname;
  }

  String get getPassword {
    return password;
  }

  set setPassword(String password) {
    this.password = password;
  }

  String get getLastname {
    return lastname;
  }

  set setLastname(String lastname) {
    this.lastname = lastname;
  }
}
