import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(terminal());
}

// ignore: camel_case_types
class terminal extends StatefulWidget {
  @override
  _terminalState createState() => _terminalState();
}

// ignore: camel_case_types
class _terminalState extends State<terminal> {
  var input;
  var output;

  web(input) async {
    var url = "http://192.168.43.149/cgi-bin/terminal.py?x=$input";
    var response = await http.get(url);
    setState(() {
      output = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("Terminal"),
          ),
          body: Container(
            child: Card(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      input = value;
                    },
                    onSubmitted: (value) {
                      web(input);
                    },
                    autofocus: true,
                    cursorColor: Colors.white,
                    cursorWidth: 2.0,
                    decoration: InputDecoration(
                      hintText: "Enter Linux Command",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      web(input);
                    },
                    child: Text("Run cmd"),
                  ),
                  Container(
                    height: 450,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [Text(output ?? '')],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}