import 'dart:math';

class Calculatorbrain{
  Calculatorbrain({this.weight, this.height});
  final int height;
  final int weight;
  double _bmi;


  String calaculateBMI(){
    double _bmi = weight / pow (height/100 , 2);
    return _bmi.toStringAsFixed(2);
  }
  String getResults(){
    if(_bmi >= 25){
      return 'Over Weight';
    }else if (_bmi > 18.5){
      return 'Normal';
    }else{
      return 'Under Weight';
    }
  }


  String getInterpretratiom(){
    if(_bmi >= 25){
      return 'You have a heigher then normal body weight, Try to exercise more';
    }else if (_bmi > 18.5){
      return 'You have a normal body weight, Good job';
    }else{
      return 'You have a lower then normal body weight, You can eat a bit more';
    }
  }
}

