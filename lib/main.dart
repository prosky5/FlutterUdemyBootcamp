import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    void play(int num) {
      assetsAudioPlayer.open(Audio('assets/note$num.wav'));
    }

    Expanded getButton(int numSound, Color color, String text) {
      return Expanded(
        child: TextButton(
          onPressed: () {
            play(numSound);
          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(color),
          ),
          child: Text(text),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getButton(1, Colors.yellow.shade500, ""),
              getButton(2, Colors.orange.shade500, ""),
              getButton(3, Colors.red.shade500, ""),
              getButton(4, Colors.pink.shade500, ""),
              getButton(5, Colors.purple.shade500, ""),
              getButton(6, Colors.blue.shade500, ""),
              getButton(7, Colors.green.shade500, ""),
            ],
          ),
        ),
      ),
    );
  }
}
