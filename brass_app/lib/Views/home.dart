import 'dart:async';

import 'package:brass_app/Controllers/LoginController.dart';
import 'package:brass_app/Views/tank_watcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<LoginController>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser != null) {
        authBloc.addFirebaseUser();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => TankWatcher()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<LoginController>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Connexion',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 10),
              Text(
                'Pas de compte ? Créer un compte ici',
                style: TextStyle(color: Colors.black.withOpacity(1.0)),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.account_circle_outlined,
                size: 50.0,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez saisir un texte';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez saisir un texte';
                  }
                  return null; //à compléter par l'équipe back-end
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                //highlightColor: Colors.blue,
                child: Container(
                  width: 150,
                  child: Text("Se connecter", textAlign: TextAlign.center),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Divider(
                            color: Colors.black,
                            thickness: 1.5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 280,
                child: SignInButton(
                  Buttons.Google, text: "Connexion avec Google",
                  onPressed: () => authBloc.loginGoogle(),),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 280,
                child: SignInButton(
                  Buttons.Facebook, text: "Connexion avec Facebook",
                  onPressed: () => authBloc.loginFacebook(),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}