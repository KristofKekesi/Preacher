import 'dart:ui';

import 'package:Preacher/localization.dart';
import 'package:Preacher/widgets/bookButton.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildLatest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            top: MediaQuery.of(context).size.width * .01,
            bottom: MediaQuery.of(context).size.width * .01,
          ),
          child: Text(
            "New On Preacher",
            style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * .06,
                fontWeight: FontWeight.w600),
          ),
        ),
        ClipRect(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://raw.githubusercontent.com/KristofKekesi/APIs/master/Preacher/v2/book/hu-HU/AHeidelbergiKate1943/1000x650.png"),
                    fit: BoxFit.cover)),
            width: MediaQuery.of(context).size.width,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: (MediaQuery.of(context).size.height +
                          MediaQuery.of(context).size.width) /
                      2 *
                      .02,
                  sigmaY: (MediaQuery.of(context).size.height +
                          MediaQuery.of(context).size.width) /
                      2 *
                      .02),
              child: Padding(
    padding: EdgeInsets.only(
    left: MediaQuery.of(context).size.width * .1,
    top: MediaQuery.of(context).size.width * .05,
    bottom: MediaQuery.of(context).size.width * .05,
    ),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: <Widget> [Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .02,), child: BookCover(status: "none", name: "A Heidelbergi Káté", color: "0xff4b9e71", metaURL: "book/hu-HU/", dir: "Karoli2014/data.json", options: [
      {
        "height": 1000,
        "width": 650,
        "dir": "AHeidelbergiKate1943/1000x650.png"
      },
      {
        "height": 500,
        "width": 325,
        "dir": "AHeidelbergiKate1943/500x325.png"
      }
    ],),),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .03,), child: AutoSizeText("A Heidelbergi Káté", style: TextStyle(fontSize: MediaQuery.of(context).size.width * .06, color: Colors.white, shadows: <Shadow>[
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 8.0,
          color: Color.fromARGB(255, 0, 0, 0),),], fontWeight: FontWeight.bold), minFontSize: 1, maxLines: 1,),),
    AutoSizeText("1942, 1. Edition", style: TextStyle(fontSize: MediaQuery.of(context).size.width * .06, color: Colors.white, shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 8.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],), minFontSize: 1, maxLines: 1,),
    AutoSizeText("Calvinism", style: TextStyle(fontSize: MediaQuery.of(context).size.width * .06, color: Colors.white, shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 8.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],), minFontSize: 1, maxLines: 1,),
    ],),],),),
            ),
          ),
        ),
      ],
    );
  }
}
