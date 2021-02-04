import 'package:Preacher/meta.dart';
import 'package:Preacher/widgets/language.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../localization.dart';

class BuildLanguages extends StatelessWidget {
  final String extension;

  BuildLanguages(this.extension);

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
              child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.black87)),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              DioError error = snapshot.error;
              print(error.message);
              String message = AppLocalizations.of(context).translate("errorNoConnection");
              if (error.type == DioErrorType.CONNECT_TIMEOUT)
                message = AppLocalizations.of(context).translate("errorConnectionTimeout");
              else if (error.type == DioErrorType.RECEIVE_TIMEOUT)
                message = AppLocalizations.of(context).translate("errorReceiveTimeout");
              else if (error.type == DioErrorType.RESPONSE)
                message = AppLocalizations.of(context).translate("error404") + ' ${error.response.statusCode}';
              return Center(child: Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .1, right: MediaQuery.of(context).size.width * .1), child: Text(AppLocalizations.of(context).translate("errorError") + ' $message', style: TextStyle(fontSize: MediaQuery.of(context).size.width * .06, fontWeight: FontWeight.w600),),),);
            }
            List<Widget> languages = List<Widget>();
            Response response = snapshot.data;

            Widget language;
            for (int i = 0; i < response.data['data'].length; i++) {


              language = Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .1,
                        top: MediaQuery.of(context).size.width * .01,
                        bottom: MediaQuery.of(context).size.width * .01,
                      ), child: Text(response.data['data'][i][AppLocalizations.of(context).translate('localizationKey')],
                style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.width * .06, fontWeight: FontWeight.w600),),),);

              if (response.data['data'][i]["code"] == AppLocalizations.of(context).translate('localizationKey')) {
                languages.insert(0, language);
              } else {
                languages.add(language);
              }

              language = BuildLanguage(response.data['meta']['url'] + response.data['data'][i]['dir'], MediaQuery.of(context).size.width * .1);
              if (response.data['data'][i]["code"] == AppLocalizations.of(context).translate('localizationKey')) {
                languages.insert(1, language);
              } else {
                languages.add(language);
              }
            }

            languages.add(Container(height: MediaQuery.of(context).size.height * .035,));

            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: languages);
        }
        return Container();
      },
    );
  }

}