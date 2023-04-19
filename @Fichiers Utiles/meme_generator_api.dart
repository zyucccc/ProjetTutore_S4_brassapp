import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:math';

Future<Post> fetchPost() async {
  var n = new Random();
  final response = await http.get("http://alpha-meme-maker.herokuapp.com/memes/" + n.nextInt(100).toString() + "/");

  if (response.statusCode == 200)
    return Post.fromJson(json.decode(response.body));
}

class Post {
  int code;
  Data data;
  String message;

  Post({this.code, this.data, this.message});

  Post.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int iD;
  String bottomText;
  String detail;
  String image;
  String name;
  int rank;
  String tags;
  String thumb;
  String topText;

  Data(
      {this.iD,
        this.bottomText,
        this.detail,
        this.image,
        this.name,
        this.rank,
        this.tags,
        this.thumb,
        this.topText});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    bottomText = json['bottomText'];
    detail = json['detail'];
    image = json['image'];
    name = json['name'];
    rank = json['rank'];
    tags = json['tags'];
    thumb = json['thumb'];
    topText = json['topText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['bottomText'] = this.bottomText;
    data['detail'] = this.detail;
    data['image'] = this.image;
    data['name'] = this.name;
    data['rank'] = this.rank;
    data['tags'] = this.tags;
    data['thumb'] = this.thumb;
    data['topText'] = this.topText;
    return data;
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Post> post;

  @override
  Widget build(BuildContext context) {
    post = fetchPost();
      return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {

            if (snapshot.hasData)
              return Image.network(snapshot.data.data.image);
            else if (snapshot.hasError)
              return Text("${ snapshot.error }");

            return CircularProgressIndicator();
          },
        ),
      )
    );
  }
}
