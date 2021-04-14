import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: App()));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.black,
      ),
      body: MagicBall(),
    );
  }
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  //TODO:
  // Map<String, List<String>> matrix = generatePhrases();

  int randomVal = 1;

  void randomize() {
    setState(() {
      randomVal = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () {
            randomize();
          },
          child: Image.asset('images/ball$randomVal.png'),
        ),
      ),
    );
  }
}

Map<String, List<String>> generatePhrases() {
  return {
    "Good": [
      "It is certain",
      "It is decidedly so",
      "Without a doubt",
      "Yes",
      "You may rely on it"
    ],
    "Maybe": [
      "As I see it, yes",
      "Most likely",
      "Outlook good",
      "Signs point to yes",
      "Yes"
    ],
    "Neutral": [
      "Reply hazy, try again",
      "Ask again later",
      "Better not tell you now",
      "Cannot predict now",
      "Concentrate and ask again"
    ],
    "Negative": [
      "Don’t count on it",
      "My reply is no",
      "My sources say no",
      "Outlook not so good",
      "Very doubtful"
    ]
  };
}
