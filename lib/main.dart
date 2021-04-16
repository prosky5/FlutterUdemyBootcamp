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

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    play(1);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow.shade500),
                  ),
                  child: Text(""),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    play(2);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange.shade500),
                  ),
                  child: Text(""),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    play(3);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade500),
                  ),
                  child: Text(""),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    play(4);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.pink.shade500),
                  ),
                  child: Text(""),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    play(5);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple.shade500),
                  ),
                  child: Text(""),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    play(6);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue.shade500),
                  ),
                  child: Text(""),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    play(7);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green.shade500),
                  ),
                  child: Text(""),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
