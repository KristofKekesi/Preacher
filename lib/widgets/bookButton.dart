import 'package:Preacher/meta.dart';
import 'package:Preacher/pages/stateMaintenance.dart';
import 'package:Preacher/pages/stateError.dart';
import 'package:Preacher/pages/directory.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'optimizedImages.dart';

class BookCover extends StatelessWidget {
  final String status;
  final String name;
  final String color;
  final String metaURL;
  final String dir;

  final options;

  const BookCover({Key key, this.status, this.name, this.color, this.metaURL,  this.options, this.dir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular((MediaQuery
            .of(context)
            .size
            .height + MediaQuery
            .of(context)
            .size
            .width) / 2 * .01),
        child: GestureDetector(onTap: (){
          if (status == "maintenance") {Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MaintenancePage(title: name, color: color, extension: metaURL + dir, backgroundPre: metaURL, backgroundOptions: options, action: Directory(name, color, metaURL + dir, metaURL, options,),))
          );} else if (status == "error") {Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>ErrorPage(title: name, color: color, extension: metaURL + dir, backgroundPre: metaURL, backgroundOptions: options, action: Directory(name, color, metaURL + dir, metaURL, options,),))
          );} else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Directory(name, color, metaURL + dir, metaURL, options,),
              ),
            );}},
          child: Tooltip(message: name, child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * .25, width: MediaQuery
              .of(context)
              .size
              .height * .1625,
            decoration: BoxDecoration(color: Color(int.parse(color))),
            child: Stack(children: <Widget>[Image(image: NetworkImage(
              apiUrl  + metaURL + optimizedImages(options, MediaQuery
                  .of(context)
                  .size
                  .height * .25, MediaQuery
                  .of(context)
                  .size
                  .height * .1625),),
            ),
              Center(child: Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .02, right: MediaQuery.of(context).size.width * .02), child: AutoSizeText(name, wrapWords: false, textAlign: TextAlign.center,  style: TextStyle(fontSize: MediaQuery.of(context).size.width * .15, shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
                  fontWeight: FontWeight.w800, color: Colors.white), maxLines: 3, minFontSize: 1,),),),
            ],
            ),
          ),),),),
    );
  }
}