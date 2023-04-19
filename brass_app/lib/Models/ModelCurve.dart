import 'ModelPoint.dart';

class Curve {
  int id;
  String valueLabel; // Ex: °C, CO2, pH...
  List<Point> points = List<Point>();

  Curve.add(int id, String valueLabel, Point point) {
    this.id = id;
    this.valueLabel = valueLabel;
    this.points.add(point);
  }

  Curve(this.id, this.valueLabel, this.points);

  int getId(){
    return id;
  }
  String getValueLabel(){
    return this.valueLabel;
  }
  List<Point> getPoints(){
    return this.points;
  }
  void setId (int id){
    this.id = id;
  }
  void setValueLabel (String valueLabel){
    this.valueLabel = valueLabel;
  }
  void setPoints (List<Point> points){
    this.points = points;
  }
  
/*
  int curveUpadater(){

  }
 */
}