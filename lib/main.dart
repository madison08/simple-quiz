import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;

  var _totalScore = 0;

  static const questions = [
    {
      "questionText": "Quel est le nom du developpeur de cette applcation ?",
      "Answer": [
        {'text': 'Kouadio', 'score': 0},
        {'text': 'Desire', 'score': 0},
        {'text': 'Madison', 'score': 5}
      ]
    },
    {
      "questionText": "Quel est la technos pref de madison",
      "Answer": [
        {'text': 'PHP', 'score': 0},
        {'text': 'vuejs', 'score': 0},
        {'text': 'flutter', 'score': 5}
      ]
    },
    {
      "questionText": "Quel est le plus metier cool ?",
      "Answer": [
        {'text': 'Footballeur', 'score': 0},
        {'text': 'programmeur', 'score': 5},
        {'text': 'Medecin', 'score': 0}
      ]
    },
  ];

  void _answer(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _index = _index + 1;
    });
  }

  void _replay() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  @override //build existe dans stateless ecrire override permet de dire nous remplacons le build() qui existe dans stateless par notre propre build()
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _index < questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Question(questions[_index]["questionText"]),
                  ...(questions[_index]['Answer'] as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(
                        () => _answer(answer['score']), answer['text']);
                  }).toList()
                ],
              )
            : Result(_replay, _totalScore),
      ),
    );
  }
}
