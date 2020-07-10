import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton(
                    color: Colors.blue.shade50,
                    onPressed: () {
                      final player = AudioCache();
                      player.play('note1.wav');
                    },
                    child: Text('click me 1')),
                FlatButton(
                    color: Colors.blue.shade100,
                    onPressed: () {
                      final player = AudioCache();
                      player.play('note2.wav');
                    },
                    child: Text('click me 2')),
                FlatButton(
                    color: Colors.blue.shade200,
                    onPressed: () {
                      final player = AudioCache();
                      player.play('note3.wav');
                    },
                    child: Text('click me 3')),
                FlatButton(
                    color: Colors.blue.shade300,
                    onPressed: () {
                      final player = AudioCache();
                      player.play('note4.wav');
                    },
                    child: Text('click me 4')),
                FlatButton(
                    color: Colors.blue.shade400,
                    onPressed: () {
                      final player = AudioCache();
                      player.play('note5.wav');
                    },
                    child: Text('click me 5')),
                FlatButton(
                    color: Colors.blue.shade600,
                    onPressed: () {
                      final player = AudioCache();
                      player.play('note6.wav');
                    },
                    child: Text('click me 6')),
                FlatButton(
                    color: Colors.blue.shade700,
                    onPressed: () {
                      final player = AudioCache();
                      player.play('note7.wav');
                    },
                    child: Text('click me 7')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
