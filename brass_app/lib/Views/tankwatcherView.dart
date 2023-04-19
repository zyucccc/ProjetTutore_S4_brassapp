import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ModelPoint.dart';
import 'ModelCurve.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LANCERPage(title: 'Flutter Demo Home Page'),
    );
  }
}

//ModelCurve modelCurve = new ModelCurve();
//modelCurve.drawCurve();

class MyLineChart extends StatelessWidget {
  //double x1,x2,x3,x4,x5,x6,x7,x8;
  //double y1,y2,y3,y4,y5,y6,y7,y8;
  //Curve curvemodel = new Curve();
  //x1
  @override
  Widget build(BuildContext context) {
    // 第一条线
    List<FlSpot> spots1 = [
      FlSpot(0, 28),
      FlSpot(17, 32),
      FlSpot(20, 28),
      FlSpot(22, 51),
      FlSpot(49, 48),
      FlSpot(58, 72),
      FlSpot(70, 68),
    ];
    List<FlSpot> spotsModel = [
      FlSpot(0, 30),
      FlSpot(20, 30),
      FlSpot(20, 50),
      FlSpot(50, 50),
      FlSpot(50, 70),
      FlSpot(70, 70),
    ];

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots1,
            colors: [Colors.green],
          ),
          LineChartBarData(
            spots: spotsModel,
          ),

        ],

        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) =>
            const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
            getTitles: (value) {
              switch (value.toInt()) {
                case 2:
                  return 'MAR';
                case 5:
                  return 'JUN';
                case 8:
                  return 'SEP';
              }
              return '';
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '10k';
                case 3:
                  return '30k';
                case 5:
                  return '50k';
              }
              return '';
            },
            reservedSize: 28,
            margin: 12,
          ),
        ),
      ),
    );
  }
}
class MyLineChartPH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 第一条线
    List<FlSpot> spots1 = [
      FlSpot(0, 3),
      FlSpot(25, 3.8),
      FlSpot(50, 6.4),
      FlSpot(70, 7.5),
    ];

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots1,
            isCurved: true,
            colors: [Colors.green],
          ),

        ],
      ),
    );
  }
}

class LANCERPage extends StatefulWidget {
  LANCERPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LANCERPageState createState() => _LANCERPageState();
}

class _LANCERPageState extends State<LANCERPage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:1,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Brass'App"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            bottom: TabBar(

              isScrollable: false,

              indicatorColor: Colors.blue,
              //未选中的颜色
              unselectedLabelColor:Colors.black,
              //文字颜色
              labelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "Courve en attente",
                ),
              ],
            ),

          ),
          body:
          TabBarView(
            //Page temperature
            children: <Widget>[

              ListView(
                children: <Widget>[
                  SizedBox(height: 40),
                  ListTile(

                    title: Text("Courve en attente",textAlign: TextAlign.center,style: TextStyle(fontSize: 50,),
                    ),
                  ),
                  SizedBox(height: 90),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        new MaterialButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: new Text('Lancer lempatage',style: TextStyle(fontSize: 35,),),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                          },
                        ),
                      ]
                  ),

                ],
              ),
            ],

          ),

        )
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class Pointvaleur extends StatefulWidget  {
  static const   temperature = '70.0';
  static const   temperatureCib = '6.0' ;
  static const   pH = '6.5' ;
  static const   tauxdeCo2 = '60.0' ;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
//@override
// _PointvaleurState createState() => _PointvaleurState();
}
class _MyHomePageState extends State<MyHomePage> {


  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
        length:3,
        child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            centerTitle: true,
            title: Text("Brass'App"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            bottom: TabBar(
              //是否可以滚动
              isScrollable: false,
              //选中的颜色
              indicatorColor: Colors.blue,
              //未选中的颜色
              unselectedLabelColor:Colors.black,
              //文字颜色
              labelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "Temperature",
                ),
                Tab(
                  text: "CO2",
                ),
                Tab(
                  text: "PH",
                ),
              ],
            ),

          ),
          body:
          TabBarView(
            //Page temperature
            children: <Widget>[
              ListView(
                children: <Widget>[

                  ListTile(
                    title: Text("Courbe de temperature",textAlign: TextAlign.center,
                    ),
                  ),
                  MyLineChart(),

                  Divider(height: 20.0,color: Colors.black,thickness:2),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature"),
                          Text(Pointvaleur.temperature),
                          Text("                                           "),

                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature cible"),

                          Text(Pointvaleur.temperatureCib),
                          Text("                                                     "),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     PH                 "),

                          Text(Pointvaleur.pH),
                          //Text("                          "),
                          new MaterialButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: new Text('Arreter le brassage'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LANCERPage()),
                              );
                            },
                          ),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Taux de CO2"),

                          Text(Pointvaleur.tauxdeCo2),
                          Text("                                           "),
                        ]
                    ),
                  ),

                ],
              ),
              //Page CO2
              ListView(
                children: <Widget>[

                  ListTile(
                    title: Text("Courbe de CO2",textAlign: TextAlign.center,
                    ),
                  ),
                  // Container(
                  MyLineChart(),
                  //),

                  Divider(height: 20.0,color: Colors.black,thickness:2),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature"),
                          Text(Pointvaleur.temperature),
                          Text("                                           "),

                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature cible"),

                          Text(Pointvaleur.temperatureCib),
                          Text("                                                     "),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     PH                 "),

                          Text(Pointvaleur.pH),
                          //Text("                          "),
                          new MaterialButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: new Text('Arreter le brassage'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LANCERPage()),
                              );
                            },
                          ),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Taux de CO2"),

                          Text(Pointvaleur.tauxdeCo2),
                          Text("                                           "),
                        ]
                    ),
                  ),
                ],
              ),
             //page ph
              ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("Courbe de ph",textAlign: TextAlign.center,
                    ),
                  ),
                  MyLineChartPH(),
                  Divider(height: 20.0,color: Colors.black,thickness:2),

                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature"),
                          Text(Pointvaleur.temperature),
                          Text("                                           "),

                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature cible"),

                          Text(Pointvaleur.temperatureCib),
                          Text("                                                     "),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     PH                 "),

                          Text(Pointvaleur.pH),
                          //Text("                          "),
                          new MaterialButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: new Text('Arreter le brassage'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LANCERPage()),
                              );
                            },
                          ),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Taux de CO2"),

                          Text(Pointvaleur.tauxdeCo2),
                          Text("                                           "),
                        ]
                    ),
                  ),
                ],
              ),
            ],

          ),
        )
    );
  }
}