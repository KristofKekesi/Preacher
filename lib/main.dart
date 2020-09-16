import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preacher',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) => SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .25,
                  top: MediaQuery.of(context).size.height * .02,
                  bottom: MediaQuery.of(context).size.height * .02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Tooltip(
                        message: 'Menu',
                        child: Icon(Icons.menu, size: MediaQuery.of(context).size.width * .08, color: Colors.black,),
                      ),
                    ),
                  AutoSizeText(" Preacher", textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * .08,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
