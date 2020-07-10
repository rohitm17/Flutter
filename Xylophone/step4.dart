import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
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
                Expanded(
                  child: FlatButton(
                      color: Colors.blue.shade50,
                      onPressed: () {
                        playSound(1);
                      },
                      child: Text('click me 1')),
                ),
                Expanded(
                  child: FlatButton(
                      color: Colors.blue.shade100,
                      onPressed: () {
                        playSound(2);
                      },
                      child: Text('click me 2')),
                ),
                Expanded(
                  child: FlatButton(
                      color: Colors.blue.shade200,
                      onPressed: () {
                        playSound(3);
                      },
                      child: Text('click me 3')),
                ),
                Expanded(
                  child: FlatButton(
                      color: Colors.blue.shade300,
                      onPressed: () {
                        playSound(4);
                      },
                      child: Text('click me 4')),
                ),
                Expanded(
                  child: FlatButton(
                      color: Colors.blue.shade400,
                      onPressed: () {
                        playSound(5);
                      },
                      child: Text('click me 5')),
                ),
                Expanded(
                  child: FlatButton(
                      color: Colors.blue.shade600,
                      onPressed: () {
                        playSound(6);
                      },
                      child: Text('click me 6')),
                ),
                Expanded(
                  child: FlatButton(
                      color: Colors.blue.shade700,
                      onPressed: () {
                        playSound(7);
                      },
                      child: Text('click me 7')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
