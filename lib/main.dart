import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;

  void _answer() {
    setState(() {
      _index = _index + 1;
    });
  }

  @override //build existe dans stateless ecrire override permet de dire nous remplacons le build() qui existe dans stateless par notre propre build()
  Widget build(BuildContext context) {
    var questions = [
      {
        "questionText": "quel est votre animal preferez ?",
        "Answer": ['Black', 'Red', 'Green', 'White']
      },
      {
        "questionText": "quel est votre animal preferez ?",
        "Answer": ['Snake', 'Elephant', 'Lion']
      },
      {
        "questionText": "Qui est votre instructeur favoris ?",
        "Answer": ['dev madison', 'dev dev', 'mec dev']
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My app'),
        ),
        body: Column(
          children: [
            Question(questions[_index]["questionText"]),
            Answer(_answer),
            Answer(_answer),
            Answer(_answer),
          ],
        ),
      ),
    );
  }
}
