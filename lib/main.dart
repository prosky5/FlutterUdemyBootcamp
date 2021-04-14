import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.teal,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceValLeft = 1;
  int diceValRight = 1;

  void randomizeDices() {
    setState(() {
      diceValLeft = Random().nextInt(6) + 1;
      diceValRight = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            onPressed: () {
              randomizeDices();
            },
            child: Image.asset('images/dice$diceValLeft.png'),
          )),
          Expanded(
              child: TextButton(
            onPressed: () {
              randomizeDices();
            },
            child: Image.asset('images/dice$diceValRight.png'),
          ))
        ],
      ),
    );
  }
}
