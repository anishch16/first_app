import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//  runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 6},
        {'text': 'Red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'rabbit', 'score': 2},
        {'text': 'cow', 'score': 2},
        {'text': 'dog', 'score': 2},
        {'text': 'cat', 'score': 2},
      ],
    },
    {
      'questionText': 'who\'s your favorite teacher',
      'answers': [
        {'text': 'kashmir', 'score': 1},
        {'text': 'yaman', 'score': 1},
        {'text': 'phul', 'score': 1},
        {'text': 'mohit', 'score': 1},
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
    //var aBoool = true;
    //aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['hello'];
    // dummy.add('max');
    // print(dummy);
    // dummy = [];

    //questions = []; //doesn't work if the above question is const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
