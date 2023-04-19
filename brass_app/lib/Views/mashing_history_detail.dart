import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Brass\'app';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length:3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Brass'App"),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),

              bottom : TabBar(
                isScrollable: false,
                indicatorColor: Colors.blue,
                unselectedLabelColor:Colors.black,
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
            body : Center(
              child : Container(
                child : MyStatelessWidget(),
              ),
            ),
          ),
        ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Empatâge du [date]',
            style: Theme.of(context).textTheme.headline5,
          ),

          SizedBox(height: 30),
          Container(
            child : Text(
              "-- Courbe théorique",
              style: TextStyle(color: Colors.red.withOpacity(1.0)),
            ),
          ),
          Container(
          child : Text(
            " -- Courbe pratique",
            style: TextStyle(color: Colors.green.withOpacity(1.0)),
            ),
          ),
          SizedBox(height: 20),

          MyLineChartPH(),
        ],
      ),
    );
  }
}

class MyLineChartPH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<FlSpot> spots1 = [
      FlSpot(0, 0),
      FlSpot(1.8, 25),
      FlSpot(3.6, 35),
      FlSpot(5.5, 60),
    ];

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots1,
            colors: [Colors.green],
          ),
        ],
      ),
    );
  }
}


