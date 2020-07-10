import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({int soundNumber, Color color}) {
    return Expanded(
      child: FlatButton(
          color: color,
          onPressed: () {
            playSound(soundNumber);
          },
          child: Text('click me $soundNumber')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildKey(color: Colors.red.shade50, soundNumber: 1),
                buildKey(color: Colors.red.shade100, soundNumber: 2),
                buildKey(color: Colors.red.shade200, soundNumber: 3),
                buildKey(color: Colors.red.shade300, soundNumber: 4),
                buildKey(color: Colors.red.shade400, soundNumber: 5),
                buildKey(color: Colors.red.shade500, soundNumber: 6),
                buildKey(color: Colors.red.shade600, soundNumber: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
