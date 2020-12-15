import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:music/ui/video.dart';
import 'ui/video.dart';
import 'ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Application',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyBottomNavigationBar(),
      routes: <String, WidgetBuilder>{
        '/Tubitv': (BuildContext context) => new Tubitv(),
        '/JioCinema': (BuildContext context) => new JioCinema(),
        '/Youtube': (BuildContext context) => new YouTube(),
        '/MxPlayer': (BuildContext context) => new MxPlayer(),
//        '/YtMusic': (BuildContext context) => new YtMusic(),
//        '/JioSaavn': (BuildContext context) => new JioSaavn(),
//        '/Wynk': (BuildContext context) => new Wynk(),
//        '/Gaana': (BuildContext context) => new Gaana(),
      },
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {


  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentindex = 0;
  final List<Widget> _children = [
    //HomePage(),
//    Audio(),
    Video(),
  ];
  void onTappedBar(int newindex) {
    setState(() {
      _currentindex = newindex;
    });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: _children[_currentindex],
        bottomNavigationBar: CurvedNavigationBar(
        color: Colors.red,
        backgroundColor: Colors.black,
        height: 50,
        items: <Widget>[
        // Icon(Icons.home, size: 20, color: Colors.white),
        Icon(Icons.music_note, size: 20, color: Colors.white),
    Icon(Icons.ondemand_video, size: 20, color: Colors.white),
    ],
    animationDuration: Duration(milliseconds: 500),
    animationCurve: Curves.fastOutSlowIn,
    onTap: onTappedBar,
    index: _currentindex,// This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
