import 'dart:ui';

import 'package:Preacher/localization.dart';
import 'package:Preacher/meta.dart';
import 'package:Preacher/pages/directory.dart';
import 'package:Preacher/pages/stateError.dart';
import 'package:Preacher/pages/stateMaintenance.dart';
import 'package:Preacher/pages/text.dart';
import 'package:Preacher/widgets/optimizedImages.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BuildDirectory extends StatelessWidget {
  final String title;
  final String extension;
  final String color;
  final double padding;
  final String backgroundPre;
  final List backgroundOptions;

  BuildDirectory(this.title, this.extension, this.color, this.padding,
      this.backgroundPre, this.backgroundOptions);

  _fetchLanguagesData() async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 30000;
    Response response = await dio.get(apiUrl + extension);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._fetchLanguagesData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Color(int.parse(color)))),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: AutoSizeText(
                  AppLocalizations.of(context).translate("error"),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * .06),
                  maxLines: 1,
                  minFontSize: 1,
                ),
              );
            }
            List<Widget> directories = List<Widget>();
            Response response = snapshot.data;

            directories.add(
              Opacity(
                opacity: 0,
                child: Container(
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
                        Icon(
                          Icons.menu,
                          size: MediaQuery.of(context).size.width * .08,
                          color: Colors.black,
                        ),
                        AutoSizeText(
                          " " + title,
                          textAlign: TextAlign.left,
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
              ),
            );

            directories.add(Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                top: MediaQuery.of(context).size.width * .01,
                bottom: MediaQuery.of(context).size.width * .01,
              ),
              child: Text(
                response.data['meta']["name"],
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .06,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ));

            var controlTitle = AutoSizeGroup();
            var controlDescription = AutoSizeGroup();

            for (int i = 0; i < response.data['data'].length; i++) {
              directories.add(
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .01,
                      right: MediaQuery.of(context).size.width * .01),
                  child: GestureDetector(
                    onTap: () {
                      Widget buttonAction;

                      if (response.data['meta']['contains'] == "text") {
                        buttonAction = TextPage(
                          response.data['data'][i]['name'],
                          response.data['meta']['url'] +
                              response.data['data'][i]['dir'],
                          color,
                        );
                      } else {
                        buttonAction = Directory(
                              response.data['data'][i]['name'],
                              color,
                              response.data['meta']['url'] +
                                  response.data['data'][i]['dir'],
                              backgroundPre,
                              backgroundOptions,
                            );
                      }

                      print(response.data['meta']['status']);

                      if (response.data['meta']['status'] == "error") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ErrorPage(
                              response.data['data'][i]['name'],
                              color,
                              response.data['meta']['url'] +
                                  response.data['data'][i]['dir'],
                              backgroundPre,
                              backgroundOptions,
                              buttonAction
                            ),
                          ),
                        );
                      } else if (response.data['meta']['status'] == "maintenance") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MaintenancePage(
                                response.data['meta']['name'],
                                color,
                                response.data['meta']['url'] +
                                    response.data['data'][i]['dir'],
                                backgroundPre,
                                backgroundOptions,
                                buttonAction
                            ),
                          ),
                        );
                      } else if (response.data['meta']['status'] == "error") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ErrorPage(
                                response.data['data'][i]['name'],
                                color,
                                response.data['meta']['url'] +
                                    response.data['data'][i]['dir'],
                                backgroundPre,
                                backgroundOptions,
                                buttonAction
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => buttonAction));
                      }
                    },
                    child: Tooltip(
                      message: response.data['data'][i]['name'],
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: padding, right: padding, bottom: padding / 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              (MediaQuery.of(context).size.height +
                                      MediaQuery.of(context).size.width) /
                                  2 *
                                  .01),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(
                                int.parse(color),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(apiUrl +
                                    backgroundPre +
                                    optimizedImages(
                                        backgroundOptions,
                                        false,
                                        MediaQuery.of(context).size.width *
                                            .8)),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width:
                                MediaQuery.of(context).size.width - padding * 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          .03,
                                      right: MediaQuery.of(context).size.width *
                                          .03,
                                      top: MediaQuery.of(context).size.width *
                                          .02,
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              .02,
                                    ),
                                    child: SizedBox(
                                      child: AutoSizeText(
                                        response.data['data'][i]['name'],
                                        wrapWords: false,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(2.0, 2.0),
                                                blurRadius: 8.0,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ],
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .07,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                        maxLines: 1,
                                        group: controlTitle,
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: (MediaQuery.of(context)
                                                    .size
                                                    .height +
                                                MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                            2 *
                                            .05,
                                        sigmaY: (MediaQuery.of(context)
                                                    .size
                                                    .height +
                                                MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                            2 *
                                            .05),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .03,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .03,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                        ),
                                        child: SizedBox(
                                          child: AutoSizeText(
                                            response.data['data'][i]
                                                    ['description'] +
                                                " ",
                                            wrapWords: false,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .07,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                            maxLines: 2,
                                            group: controlDescription,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }

            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: directories),
              ),
            );
        }
        return Container();
      },
    );
  }
}
