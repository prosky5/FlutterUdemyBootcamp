import 'package:flutter/cupertino.dart';

class ScoreHolder {
  Icon answerIcon;
  bool isRightAnswer;

  ScoreHolder({Icon icon, bool isRight}) {
    answerIcon = icon;
    isRightAnswer = isRight;
  }
}
