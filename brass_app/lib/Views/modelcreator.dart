import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class SwitchCheckboxRoute extends StatefulWidget {
  @override
  _SwitchCheckboxRouteState createState() => _SwitchCheckboxRouteState();
}

class _SwitchCheckboxRouteState extends State<SwitchCheckboxRoute> {
  // 维护单选状态
  bool _switchSelected = true;
  // 维护复选状态
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[

            // 单选框
            Switch(
              // 当前状态
              value: _switchSelected,
              onChanged: (value){
                // 重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            ),

            // 复选框
            Checkbox(
              value: _checkboxSelected,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyLineChart extends StatelessWidget {
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
    List<FlSpot> spots2 = [
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
            colors: [Colors.green]
          ),
          LineChartBarData(
            spots: spots2,
          ),
        ],
        titlesData: FlTitlesData(
          show:false,
        )
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

class _MyHomePageState extends State<MyHomePage> {
 // get valued => null;

 // get check => null;





  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
        length:1,
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
                  text: "Courbe theorique de Temperature",
                ),
              /*  Tab(
                  text: "CO2",
                ),
                Tab(
                  text: "PH",
                ),*/
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
                          Text("4"),

                          Text("Duree"),
                          Text(" 5"),
                          new MaterialButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            child: new Text('----'),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ]
                    ),
                  ),

                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature"),
                          Text("4"),
                          Text("Duree"),
                          Text(" 5"),
                          new MaterialButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            child: new Text('----'),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature"),
                          Text("4"),
                         // TextField(decoration:
                         // InputDecoration(fillColor: Colors.blue.shade100, filled: true, labelText: 'Hello'),),
                          Text("Duree"),
                          Text(" 5"),
                          new MaterialButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            child: new Text('----'),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                       // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget>[
                          new MaterialButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: new Text('+'),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     Nom de modele"),
                          /*   TextField(
                            controller: account,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '请输入账号',
                                labelText: '左上角',
                                prefixIcon: Icon(Icons.person),
                              ),
                          )*/
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children:
                        <Widget>[
                          Text("     Publique"),
                        ]
                    ),
                  ),
                ],
              ),
              //Page CO2
             /* ListView(
                children: <Widget>[

                  ListTile(
                    title: Text("Courbe de CO2",textAlign: TextAlign.center,
                    ),
                  ),
                  MyLineChart(),

                  Divider(height: 20.0,color: Colors.black,thickness:2),
                  Container(
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text("     Temperature"),
                          new MaterialButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: new Text('Arreter le brassage'),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ]
                    ),
                  ),

                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     Temperature cible"),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     PH"),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     Taux de CO2"),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     Taux de Monoxyde"),
                        ]
                    ),
                  ),

                ],
              ),
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
                          new MaterialButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: new Text('Arreter le brassage'),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ]
                    ),
                  ),

                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     Temperature cible"),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     PH"),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     Taux de CO2"),
                        ]
                    ),
                  ),
                  Container(
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Text("     Taux de Monoxyde"),
                        ]
                    ),
                  ),
                ],




              ),*/
            ],

          ),




        )
    );
  }
}