import 'package:brass_app/Views/home.dart';
import 'package:brass_app/Views/tank_watcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'Controllers/LoginController.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => LoginController(),
      child: MaterialApp(
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
            child: HomeScreen(),
          ),
        ),
      )
    );
  }
}