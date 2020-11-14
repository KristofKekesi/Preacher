import 'package:Preacher/pages/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preacher',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
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
  void getHttps() async {
      Response response = await Dio().get('https://api.kekesi.dev/Preacher/v1/lang/data.json');
      print(response.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      title: Text(
        'Preacher',
        //AppLocalizations.of(context).translate('title'),
        style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      loadingText: Text(
        'Loading',
        //AppLocalizations.of(context).translate('loadString'),
        style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      imageBackground:
      AssetImage('lib/img/loader.png'),
      image: Image(
        image: AssetImage('lib/img/logo_512.png'),
      ),
      photoSize: 50,
      loaderColor: Colors.white,
      navigateAfterSeconds: Home(),
    );
  }
}
