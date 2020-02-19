import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = const [
      {
        'questionText' : 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText' : 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText' : 'Who\'s your favorite rapper?',
        'answers': ['Eminem', 'Lil Pump', 'Pi\'erre Bourne', 'Jay Z'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Second App'),),
        body: Column(
          children: [
            Question(
              ...questions[_questionIndex]['questionText'],
            ),
            (questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}