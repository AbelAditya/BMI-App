import 'dart:math';
class Calculator{
  Calculator({this.weight=0,this.height=0}){
    _bmi = this.weight/(pow(this.height/100, 2));
  }

  final int height;
  final int weight;

  late double _bmi;

  String BMIval(){
    return _bmi.toStringAsFixed(1);
  }

  String result(){
    double x = double.parse(_bmi.toStringAsFixed(1));
    if(x<18.5){
      return "UNDERWEIGHT";
    }
    else if (x>=18.5 && x<=24.9){
      return "NORMAL";
    }
    else{
      return "OVERWEIGHT";
    }
  }

  String comment(){
    double x = double.parse(_bmi.toStringAsFixed(1));
    if(x<18.5){
      return "You have a lower than normal BMI. You can eat a bit more";
    }
    else if (x>=18.5 && x<=24.9){
      return "You have a normal BMI. Good job";
    }
    else{
      return "You have a higher than normal BMI. Try to exercise more";
    }
  }
}