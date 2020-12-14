import 'package:Preacher/localization.dart';
import 'package:Preacher/pages/directory.dart';
import 'package:Preacher/pages/stateError.dart';
import 'package:Preacher/pages/stateMaintenance.dart';
import 'package:Preacher/widgets/optimizedImages.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../meta.dart';

class BuildLanguage extends StatelessWidget {
  final String extension;
  final double padding;

  BuildLanguage(this.extension, this.padding);

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
            return Container(height: MediaQuery
                  .of(context)
                  .size
                  .height * .25, child: Center(
              child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.black87)),),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(child: AutoSizeText(AppLocalizations.of(context).translate("error"), style:  TextStyle(fontWeight: FontWeight.w600), maxLines: 1, minFontSize: 1,),);
            }
            List<Widget> books = List<Widget>();
            Response response = snapshot.data;

            books.add(Container(
                width: padding - MediaQuery
                .of(context)
                .size
                .width * .01),);
            for (int i = 0; i < response.data['data'].length; i++) {
              books.add(Padding(padding: EdgeInsets.only(left: MediaQuery
                  .of(context)
                  .size
                  .width * .01,
                  right: MediaQuery
                  .of(context)
                  .size
                  .width * .01),
                child: StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
    return ClipRRect(
                borderRadius: BorderRadius.circular((MediaQuery
                    .of(context)
                    .size
                    .height + MediaQuery
                    .of(context)
                    .size
                    .width) / 2 * .01),
                child: GestureDetector(onTap: (){
                  if (response.data['meta']['status'] == "maintenance") {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MaintenancePage(response.data['data'][i]['name'], response.data['data'][i]['color'], response.data['meta']['url'] + response.data['data'][i]['dir'], response.data['meta']['url'], response.data['data'][i]['images'], Directory(response.data['data'][i]['name'], response.data['data'][i]['color'], response.data['meta']['url'] + response.data['data'][i]['dir'], response.data['meta']['url'], response.data['data'][i]['images'],),))
                  );} else if (response.data['meta']['status'] == "error") {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>ErrorPage(response.data['data'][i]['name'], response.data['data'][i]['color'], response.data['meta']['url'] + response.data['data'][i]['dir'], response.data['meta']['url'], response.data['data'][i]['images'],Directory(response.data['data'][i]['name'], response.data['data'][i]['color'], response.data['meta']['url'] + response.data['data'][i]['dir'], response.data['meta']['url'], response.data['data'][i]['images'],),))
                  );} else {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Directory(response.data['data'][i]['name'], response.data['data'][i]['color'], response.data['meta']['url'] + response.data['data'][i]['dir'], response.data['meta']['url'], response.data['data'][i]['images'],),
                  ),
                );}},
                  child: Tooltip(message: response.data['data'][i]['name'], child: Container(
                  decoration: BoxDecoration(color: Color(int.parse(response.data['data'][i]['color']))),
                  height: MediaQuery
                    .of(context)
                    .size
                    .height * .25,
                  width: MediaQuery
                      .of(context)
                      .size
                      .height * .1625,
                  child: Stack(children: <Widget>[Image(image: NetworkImage(
                    apiUrl  + response.data['meta']['url'] + optimizedImages(response.data['data'][i]['images'], MediaQuery
                        .of(context)
                        .size
                        .height * .25, MediaQuery
                        .of(context)
                        .size
                        .height * .1625),),
                  ),
                    Center(child: Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .02, right: MediaQuery.of(context).size.width * .02), child: AutoSizeText(response.data['data'][i]['name'], wrapWords: false, textAlign: TextAlign.center,  style: TextStyle(fontSize: MediaQuery.of(context).size.width * .15, shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                        fontWeight: FontWeight.w800, color: Colors.white), maxLines: 3, minFontSize: 1,),),),
                  ],
                  ),
                ),),),);},),
              ),);
                  }
                  books.add(Container(width: padding - MediaQuery.of(context)
                  .size
                  .width * .01));

        return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        },child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: books),
        ),);
        }
        return Container();
      },
    );
  }

}