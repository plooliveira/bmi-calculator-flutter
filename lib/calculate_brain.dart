import 'dart:math';
import 'package:flutter/material.dart';

import 'constants.dart';

class CalculateBrain {
  double _bmi;

  CalculateBrain({@required this.weight, @required this.height, @required this.gender});

  final double weight;
  final double height;
  final Gender gender;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  getResult() {
    print(_bmi);
    if (gender == Gender.male || gender == Gender.non) {
      if (_bmi >= 26.4) {
        return 'Excesso de peso';
      } else if (_bmi >= 20.7) {
        return 'Normal';
      } else {
        return 'Abaixo do peso';
      }
    } else if (gender == Gender.female){
      if (_bmi >= 25.8) {
        return 'Excesso de peso';
      } else if (_bmi >= 19.1) {
        return 'Normal';
      } else {
        return 'Abaixo do peso';
      }
    }
  }

  getInterpretation(){
    print(gender);
    if (gender == Gender.male || gender == Gender.non) {
      if (_bmi >= 26.4) {
        return 'Você está acima do seu peso normal. Faça exercícios :)';
      } else if (_bmi >= 20.7) {
        return 'Você está no peso ideal. Bom trabalho!';
      } else {
        return 'Você está abaixo do peso ideal. Precisa se alimentar melhor ;)';
      }
    } else if (gender == Gender.female){
      if (_bmi >= 25.8) {
        return 'Você está acima do seu peso normal. Faça exercícios :)';
      } else if (_bmi >= 19.1) {
        return 'Você está no peso ideal. Bom trabalho!';
      } else {
        return 'Você está abaixo do peso ideal. Precisa se alimentar melhor ;)';
      }
    }
  }


}
