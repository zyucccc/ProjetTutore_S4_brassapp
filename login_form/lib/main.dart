import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Brass\'app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Brass\'app'),
          //leading: new IconButton(
          //icon: new Icon (Icons.table_rows),
          //onPressed: (){}),
        ),
        body: Center(
          child:Square(),
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 550,
      decoration: BoxDecoration(
        color: Colors.grey,
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
              style: TextStyle(color: Colors.black.withOpacity(0.8)),
            ),
            SizedBox(height: 10),
            Icon(
              Icons.switch_account,
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
            OutlineButton(
              onPressed: () { },
              color: Colors.blue,
              highlightColor: Colors.blue,
              child: Container(
                width:150,
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
                          color: Colors.black
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            OutlineButton( //Pour toi Osmane <3
              onPressed: () { },
              color: Colors.blue,
              highlightColor: Colors.blue,
              child: Container(
                width:200,
                child: Text("Se connecter avec Facebook", textAlign: TextAlign.center),
              ),
            ),
            SizedBox(height: 10),
            OutlineButton(
              onPressed: () { },
              color: Colors.blue,
              highlightColor: Colors.blue,
              child: Container(
                width:200,
                child: Text("Se connecter avec Google", textAlign: TextAlign.center),
              ),
            ),
          ]
      ),
    );
  }
}