class Point {
  double value;  //axe longitudinal
  double time;  //axe horizontal

  Point(this.value, this.time);

  double getValue(){
    return this.value;
  }
  double getTime(){
    return this.time;
  }
  void setValue(double value){
    this.value = value;
  }
  void setTime(double time){
    this.time = time;
  }
}