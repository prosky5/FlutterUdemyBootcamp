import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

List<Icon> scorekeeper = [];

String url = 'https://64.media.tumblr.com/'
    '8fd9c7b0fb9ecabb5f48713071029abe/'
    'tumblr_pcbz7cJbD51xyh2eoo1_500.gif';

String url2 = 'https://media.tenor.com/'
    'images/8d931c62353b5ff6addb8fe213cd9103/tenor.gif';

List<Tuple2<String, bool>> questions = [
  Tuple2('You can lead a cow down stairs but not up stairs.', false),
  Tuple2('Approximately one quarter of human bones are in the feet.', true),
  Tuple2('A slug\'s blood is green.', true),
];


void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
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
      return 'QUIZZLER done.\nNice work!';
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
          child: Stack(children: [
            Center(
              child: Visibility(
                visible: !getFinal(),
                child: Image.network(url),
              ),
            ),
            Center(
              child: Visibility(
                visible: getFinal(),
                child: Image.asset('images/nice.gif'),
              ),
            ),
            Padding(
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
            )
          ]),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Visibility(
              visible: getFinal(),
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
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Visibility(
              visible: getFinal(),
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
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

bool getFinal() {
  if (scorekeeper.length >= questions.length)
    return false;
  else
    return true;
}
