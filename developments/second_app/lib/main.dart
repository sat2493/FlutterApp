import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText' : 'What\'s your favorite color?',
      'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 6},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ],
    },
    {
      'questionText' : 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Giraffe', 'score': 6},
        {'text': 'Monkey', 'score': 3},
        {'text': 'Human', 'score': 1}
      ],
    },
    {
      'questionText' : 'Who\'s your favorite rapper?',
      'answers': [
        {'text': 'Eminem', 'score': 10},
        {'text': 'Lil Xan', 'score': 6},
        {'text': 'D Savage', 'score': 3},
        {'text': 'Lil Yachty', 'score': 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Second App'),),
        body: _questionIndex < _questions.length
            ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions
            )
            : Result(_totalScore, _resetQuiz),
            ),
      ),
    );
  }
}