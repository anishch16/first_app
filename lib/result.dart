import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'you did it';
    if (resultScore <= 8) {
      resultText = 'you are innocent';
    } else if (resultScore <= 12) {
      resultText = 'pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'should improve yourself';
    } else {
      resultText = 'stop being like this ';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text(
              'Restart Quiz',
            ),
            textColor: Colors.blueAccent,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
