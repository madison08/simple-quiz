import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function replayHandler;
  final int totalScore;

  Result(this.replayHandler, this.totalScore);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$totalScore',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          totalScore > 1 ? Text('Points') : Text('Point'),
          Text('Game over'),
          TextButton(onPressed: replayHandler, child: Text('rejouer'))
        ],
      ),
    );
  }
}
