import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

void main() => runApp(Quizzler());

// String url =
//     'https://psv4.userapi.com/c856420/u46201202/docs/d2/7f05e13f7347/Nice_cock.gif';
String image = '';

List<Icon> scorekeeper = [];

List<Tuple2<String, bool>> questions = [
  Tuple2('You can lead a cow down stairs but not up stairs.', false),
  Tuple2('Approximately one quarter of human bones are in the feet.', true),
  Tuple2('A slug\'s blood is green.', true),
];

class Quizzler extends StatelessWidget {
  // Image getEgg() {
  //   // if (scorekeeper.length >= questions.length) {
  //   return Image.network(url);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image), fit: Fit)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon checkAnswer(int question, bool answer) {
    if (answer == questions[question].item2) {
      return Icon(Icons.check, color: Colors.green);
    } else {
      return Icon(Icons.close, color: Colors.red);
    }
  }

  String getQuestion() {
    if (scorekeeper.length < questions.length) {
      return questions[scorekeeper.length].item1;
    } else {
      image = 'images/Nice_cock.gif';
      return 'QUIZZLER done.\nNice cock!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  scorekeeper.add(checkAnswer(scorekeeper.length, true));
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  scorekeeper.add(checkAnswer(scorekeeper.length, false));
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
