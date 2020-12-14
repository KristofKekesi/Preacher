import 'package:Preacher/meta.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../localization.dart';

class BuildText extends StatelessWidget {
  final String title;
  final String extension;
  final String color;

  BuildText(this.title, this.extension, this.color);

  _fetchTextData() async {

    Dio dio = new Dio();
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 30000;
    Response response = await dio.get(apiUrl + extension);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._fetchTextData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(int.parse(color)))),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              DioError error = snapshot.error;
              print(error.message);
              String message = AppLocalizations.of(context).translate("errorNoconnection");
              if (error.type == DioErrorType.CONNECT_TIMEOUT)
                message = AppLocalizations.of(context).translate("errorConnectionTimeout");
              else if (error.type == DioErrorType.RECEIVE_TIMEOUT)
                message = AppLocalizations.of(context).translate("errorReceiveTimeout");
              else if (error.type == DioErrorType.RESPONSE)
                message = AppLocalizations.of(context).translate("error404") + ' ${error.response.statusCode}';
              return Center(child: Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .1, right: MediaQuery.of(context).size.width * .1), child: Text(AppLocalizations.of(context).translate("errorError") + ' $message', style: TextStyle(fontSize: MediaQuery.of(context).size.width * .06, fontWeight: FontWeight.w600),),),);
            }
            List<Widget> render = List<Widget>();
            Response response = snapshot.data;

            render.add(Opacity(opacity: 0, child: Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .25,
                  top: MediaQuery.of(context).size.height * .03,
                  bottom: MediaQuery.of(context).size.height * .02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.menu, size: MediaQuery.of(context).size.width * .08, color: Colors.black,),
                    AutoSizeText(" " + title, textAlign: TextAlign.left,
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
            ),);


            for (int i = 0; i < response.data['data'].length; i++) {
              Widget text;

              bool elseCheck = false;

        // TITLES
        if (response.data["data"][i]["type"] == "titleWithFirstWordNum") {
        text = Align(
        alignment: Alignment.topLeft,
        child: Padding(
        padding: EdgeInsets.only(
        left: MediaQuery
            .of(context)
            .size
            .width * .1,
        right: MediaQuery
            .of(context)
            .size
            .width * .1,
        top: MediaQuery
            .of(context)
            .size
            .width * .01,
        bottom: MediaQuery
            .of(context)
            .size
            .width * .02,
        ), child:
        RichText(
          text: TextSpan(
            style: TextStyle(color: Color(int.parse(color)),
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width * .06,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: response.data['data'][i]["value"].split(" ")[0],
                  style: TextStyle(color: Color(int.parse(color)),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .width * .04,),),
              TextSpan(text: " " + response.data['data'][i]["value"].split(" ").sublist(1).join(" ").toString(),
                  style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .width * .06,),),
            ],
          ),),
        ),);
        }

        // LINES
        else if (response.data["data"][i]["type"] == "line") {
                text = Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery
                          .of(context)
                          .size
                          .width * .1,
                      right: MediaQuery
                          .of(context)
                          .size
                          .width * .1,
                      top: MediaQuery
                          .of(context)
                          .size
                          .width * .01,
                      bottom: MediaQuery
                          .of(context)
                          .size
                          .width * .02,
                    ), child: RichText(
                    text: TextSpan(
                      text: (i + 1).toString(),
                      style: TextStyle(color: Color(int.parse(color)),
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .width * .04,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: " " + response.data['data'][i]["value"],
                            style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .06,)),
                      ],
                    ),),),);
              } else if (response.data["data"][i]["type"] == "lineWithoutNum") {
          text = Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery
                    .of(context)
                    .size
                    .width * .1,
                right: MediaQuery
                    .of(context)
                    .size
                    .width * .1,
                top: MediaQuery
                    .of(context)
                    .size
                    .width * .01,
                bottom: MediaQuery
                    .of(context)
                    .size
                    .width * .02,
              ), child:
            RichText(
              text: TextSpan(
                style: TextStyle(color: Color(int.parse(color)),
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .width * .06,
                    fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(text: response.data['data'][i]["value"],
              style: TextStyle(color: Colors.black,
                fontSize: MediaQuery
                  .of(context)
                  .size
                  .width * .06,),),

            ],),),),);
        } else {elseCheck = true;}

              if (elseCheck == false){render.add(text);}
            }

            render.add(Container(height: MediaQuery.of(context).size.width * .05,));

            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
              },child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: render
                )
            ),);
        }
        return Container();
      },
    );
  }

}