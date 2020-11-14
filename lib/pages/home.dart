import 'package:dio/dio.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

import 'drawer.dart';

class Home extends StatelessWidget {
  var responseBody = [{"type": "title&num","value": "A világ teremtése"},{"type": "line","value": "Kezdetben teremté Isten az eget és a földet."},{"type": "line","value": "És látá Isten, hogy minden amit teremtett vala, ímé igen jó. És lőn este és lőn reggel, hatodik nap."}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
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
                      onTap: () async {
                        print('asd');
                        var dio = Dio();
                        var response = await dio.get('https://api.kekesi.dev/Preacher/v1/lang/hu-HU/MagyarBibliat%C3%A1rsulatK%C3%A1roli2014/%C3%93Sz%C3%B6vets%C3%A9g/data.json');
                        var responseBody = response.data;
                        print(responseBody);
                      },
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
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            JsonTable(responseBody)
          ],
        ),
      ),),
    );
  }
}