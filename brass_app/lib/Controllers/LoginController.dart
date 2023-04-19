import 'dart:convert';
import 'dart:io';

import 'package:brass_app/APIModels/ApiFireBaseUser.dart';
import 'package:brass_app/Controllers/APIController.dart';
import 'package:brass_app/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class LoginController {
  final authService = AuthService();
  final googleSignIn = GoogleSignIn(scopes: ['email']);
  final fbLogin = FacebookLogin();
  int loginID = 1;

  Stream<User> get currentUser => authService.currentUser;

  addFirebaseUser() async {
    ApiFireBaseUser user = new ApiFireBaseUser();

    print(FirebaseAuth.instance.currentUser.uid);

    
    user.idFireBase = FirebaseAuth.instance.currentUser.uid;
    user.estAdmin = "0";
    user.prenom = FirebaseAuth.instance.currentUser.displayName.split(" ").first;
    user.nom = FirebaseAuth.instance.currentUser.displayName.split(" ").getRange(1, 3).toString().replaceAll("(", "").replaceAll(")", "").replaceAll(",", "");
    user.email = FirebaseAuth.instance.currentUser.email;

    APIController.sendData("utilisateur.php", user.toJson());
  }

  loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
      );
      final result = await authService.signInWithCredential(credential);
      loginID = 0;
      addFirebaseUser();
    } catch (error) {
      print(error);
    }
  }

  loginFacebook() async {
    try {
      final res = await fbLogin.logIn(
        permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ],
      );

      switch (res.status) {
        case FacebookLoginStatus.Success:
          print("User connected!");
          final FacebookAccessToken fbToken = res.accessToken;
          final AuthCredential credential =
          FacebookAuthProvider.getCredential(fbToken.token);
          loginID = 1;
          try {
            // Assume we'll login with an error that causes `ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL`
            await authService.signInWithCredential(credential);
          } catch (e) {
            // Now we caught the error we're talking about, we get the email by calling graph API manually
            final httpClient = new HttpClient();
            final graphRequest = await httpClient.getUrl(Uri.parse(
                "https://graph.facebook.com/v2.12/me?fields=email&access_token=${res.accessToken.token}"));
            final graphResponse = await graphRequest.close();
            final graphResponseJSON = json.decode((await graphResponse
                .transform(utf8.decoder)
                .single));
            final email = graphResponseJSON["email"];

            final signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

            final GoogleSignInAccount googleUser = await googleSignIn.signIn();
            final GoogleSignInAuthentication googleAuth = await googleUser
                .authentication;
            final AuthCredential credential = GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken
            );
            final result = await authService.signInWithCredential(credential);

            if (result.user.email == email) {
              await result.user.linkWithCredential(e.credential);
            }
          }
          break;
        case FacebookLoginStatus.Cancel:
          print("User canceled connection.");
          break;
        case FacebookLoginStatus.Error:
          print("Error when connecting with Facebook.");
          break;
      }
    } catch (error) {
      print(error);
    }
  }

  logout() {
    authService.logout();
  }
}