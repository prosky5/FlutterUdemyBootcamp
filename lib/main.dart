import 'package:flutter/material.dart';
import 'package:quizzler/entity/question.dart';
import 'package:quizzler/entity/scoreHolder.dart';

final _INPROGRESS = 0;
final _SUCCESS = 1;
final _SOSO = 2;
final _FAIL = 3;

int giftNum = _INPROGRESS;
List<ScoreHolder> scorehodler = [];

String url = 'https://64.media.tumblr.com/'
    '8fd9c7b0fb9ecabb5f48713071029abe/'
    'tumblr_pcbz7cJbD51xyh2eoo1_500.gif';

String url2 = 'https://media.tenor.com/'
    'images/8d931c62353b5ff6addb8fe213cd9103/tenor.gif';

String url3 = 'https://pa1.narvii.com/'
    '5699/5828864a1cd5e7f810be11cafa614769950e6802_hq.gif';

List<Question> questions = [
  Question(q: 'You can lead a cow down stairs but not up stairs.', ans: false),
  Question(
      q: 'Approximately one quarter of human bones are in the feet.',
      ans: true),
  Question(q: 'A slug\'s blood is green.', ans: true),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Stack(children: [
            Stack(children: [
              Center(
                child: Visibility(
                  visible: getFinal() == _SUCCESS,
                  child: Image.network(url),
                ),
              ),
              Center(
                child: Visibility(
                  visible: getFinal() == _SOSO,
                  child: Image.network(url2),
                ),
              ),
              Center(
                child: Visibility(
                  visible: getFinal() == _FAIL,
                  child: Image.network(url3),
                ),
              ),
              Center(
                child: Visibility(
                  visible: getFinal() == _INPROGRESS,
                  child: Image.asset('images/nice.gif'),
                ),
              )
            ]),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                    decorationThickness: 1.0,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Visibility(
              visible: getFinal() == _INPROGRESS,
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
                    checkAnswer(scorehodler.length, true);
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
              visible: getFinal() == _INPROGRESS,
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
                    checkAnswer(scorehodler.length, false);
                  });
                },
              ),
            ),
          ),
        ),
        Row(
          children: scorehodler.isEmpty
              ? List.filled(1, Icon(Icons.error_outline, color: Colors.transparent))
              : scorehodler
                  .asMap()
                  .entries
                  .map((e) => e.value.answerIcon)
                  .toList(),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Visibility(
              visible: getFinal() > _INPROGRESS,
              child: TextButton(
                child: Text(
                  'Try again!',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  onSurface: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    scorehodler.clear();
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  checkAnswer(int questionNumber, bool answer) {
    if (answer == questions[questionNumber].answer) {
      scorehodler.add(ScoreHolder(
          icon: Icon(Icons.check, color: Colors.green), isRight: true));
    } else {
      scorehodler.add(ScoreHolder(
          icon: Icon(Icons.close, color: Colors.red), isRight: false));
    }
    // crutch for update url, sorry =)
    getQuestion();
  }

  String getQuestion() {
    if (scorehodler.length < questions.length) {
      return questions[scorehodler.length].question;
    } else {
      var answers =
          scorehodler.asMap().entries.map((e) => e.value.isRightAnswer);

      if (answers.every((element) => element == true)) {
        giftNum = _SUCCESS;
        return 'QUIZZLER done.\nNice work!';
      }
      if (answers.every((element) => element == false)) {
        giftNum = _FAIL;
        return 'QUIZZLER completely failed.\nDon\'t be upset, Username!';
      } else {
        giftNum = _SOSO;
        return 'QUIZZLER failed. \nTry again';
      }
    }
  }
}

int getFinal() {
  if (scorehodler.length >= questions.length) return giftNum;
  return _INPROGRESS;
}
