import 'package:flutter/material.dart';

class OnBoardingProviderClass extends ChangeNotifier {
  bool buttonActiveOrNot = false;
  List<Map> needSupportQuestions = [
    <String, dynamic>{
      'choose': false,
      'name': 'Мотивація',
    },
    <String, dynamic>{
      'choose': false,
      'name': 'Достаток',
    },
    <String, dynamic>{
      'choose': false,
      'name': 'Успіх',
    },
    <String, dynamic>{
      'choose': false,
      'name': 'Благополуччя',
    },
    <String, dynamic>{
      'choose': false,
      'name': 'Розвиток бізнесу',
    },
    <String, dynamic>{
      'choose': false,
      'name': 'Стартап',
    },
    <String, dynamic>{
      'choose': false,
      'name': 'Навчання',
    },
    <String, dynamic>{
      'choose': false,
      'name': 'Інше',
    },
  ];
  void choosingAnswer(int choice) {
    // ignore: avoid_function_literals_in_foreach_calls
    needSupportQuestions.forEach((element) {
      element['choose'] = false;
    });
    needSupportQuestions[choice]['choose'] = true;
    buttonActiveOrNot = true;
    notifyListeners();
  }
}
