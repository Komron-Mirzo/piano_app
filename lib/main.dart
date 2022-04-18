import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const PianoApp());
}

class PianoApp extends StatelessWidget {
  const PianoApp({Key? key}) : super(key: key);
  static AudioCache player = AudioCache(prefix: 'notes/');
  void playAudio(String fileName) {
    player.play(fileName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              PianoButton(
                onSecondWhitePress: () {
                  playAudio('a3.mp3');
                },
              ),
              PianoButtonSuperKey(
                onBlackPress: () {
                  playAudio('a4.mp3');
                },
                onWhitePress: () {
                  playAudio('a-4.mp3');
                },
              ),
              PianoButtonSuperKey(
                onBlackPress: () {
                  playAudio('c3.mp3');
                },
                onWhitePress: () {
                  playAudio('c-3.mp3');
                },
              ),
              PianoButtonSuperKey(
                onBlackPress: () {
                  playAudio('d3.mp3');
                },
                onWhitePress: () {
                  playAudio('d-3.mp3');
                },
              ),
              PianoButton(
                onSecondWhitePress: () {
                  playAudio('e3.mp3');
                },
              ),
              PianoButtonSuperKey(
                onBlackPress: () {
                  playAudio('f3.mp3');
                },
                onWhitePress: () {
                  playAudio('f-3.mp3');
                },
              ),
              PianoButtonSuperKey(
                onBlackPress: () {
                  playAudio('g3.mp3');
                },
                onWhitePress: () {
                  playAudio('g-3.mp3');
                },
              ),
              PianoButton(
                onSecondWhitePress: () {
                  playAudio('b3.mp3');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PianoButtonSuperKey extends StatelessWidget {
  final VoidCallback onWhitePress;
  final VoidCallback onBlackPress;
  PianoButtonSuperKey(
      {Key? key, required this.onWhitePress, required this.onBlackPress})
      : super(key: key);

  final ButtonStyle style = ElevatedButton.styleFrom(
    primary: Colors.white60,
    side: BorderSide.none,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              height: double.infinity,
              width: double.infinity,
              child: ElevatedButton(
                style: style,
                onPressed: onWhitePress,
                child: null,
              ),
            ),
          ),
          Positioned(
            top: -25.0,
            child: Container(
              height: 75.0,
              width: 250.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: onBlackPress,
                child: null,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class PianoButton extends StatelessWidget {
  final VoidCallback onSecondWhitePress;

  PianoButton({
    Key? key,
    required this.onSecondWhitePress,
  }) : super(key: key);

  final ButtonStyle style2 = ElevatedButton.styleFrom(
    primary: Colors.white60,
    side: BorderSide.none,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          height: double.infinity,
          width: double.infinity,
          child: ElevatedButton(
            style: style2,
            onPressed: onSecondWhitePress,
            child: null,
          ),
        ),
      ),
    );
  }
}
