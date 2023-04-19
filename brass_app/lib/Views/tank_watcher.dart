import 'dart:async';

import 'package:brass_app/Views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brass_app/Controllers/LoginController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class TankWatcher extends StatefulWidget {
  @override
  _TankWatcherState createState() => _TankWatcherState();
}

class _TankWatcherState extends State<TankWatcher> {
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<LoginController>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
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

    test() {

    }

    return Scaffold(
      body: Center(
        child: StreamBuilder<User>(
            stream: authBloc.currentUser,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bonjour " + snapshot.data.displayName + ",",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    SizedBox(height: 250),

                    Text(
                      "Cuve en attente...",
                      style: TextStyle(fontSize: 26.0, color: Colors.black),
                    ),

                    RaisedButton(child: Text("Lancer un empâtage"), color: Colors.green,onPressed: () => test()),

                    SizedBox(height: 250),

                    SizedBox(
                      width: 280,
                      child: SignInButton(Buttons.Facebook, text: "Déconnexion de Facebook",
                        onPressed: () => authBloc.logout(),),
                    )
                  ]);
            }),
      ),
    );
  }
}
