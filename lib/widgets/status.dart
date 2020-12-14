import 'package:Preacher/localization.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../meta.dart';

void check(context, extension){

  _fetchCheckData() async {
    try {
      Dio dio = new Dio();
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 30000;

      Response response = await dio.get(apiUrl + extension);

      bool version = false;
      bool api = false;

      if(response.data["outdated"] == true) {
        api = true;
      }
      if(response.data["latestSupportedBuild"] > build) {
        version = true;
      }

      if (api == true || version == true) {
        showCupertinoModalBottomSheet(
          topRadius: Radius.circular(
              (MediaQuery.of(context).size.height +
                  MediaQuery.of(context).size.width) /
                  2 *
                  .05,),
          bounce: false,
            context: context,
            backgroundColor: Colors.white,
            builder: (context) {
              return CheckPopup(version: version, api: api);
            });
      } else {
      }
    } catch (e) {}
  }

  _fetchCheckData();
}

class CheckPopup extends StatelessWidget {
  final bool version;
  final bool api;

  CheckPopup({Key key, this.version, this.api}) : super(key: key);

  var checkPopupGroup = AutoSizeGroup();
  @override
  Widget build(BuildContext context) {
          Widget versionWidget;
          if (version == true) {
            versionWidget = Row(children: <Widget>[Icon(Icons.circle, color: Colors.orangeAccent,), AutoSizeText("  " + AppLocalizations.of(context).translate("updateOutdatedVersion"), group: checkPopupGroup, style: TextStyle(fontSize: MediaQuery.of(context).size.width * .05, fontWeight: FontWeight.w600), maxLines: 1, minFontSize: 1,),],);
          } else {
            versionWidget = Row(children: <Widget>[Icon(Icons.circle, color: Colors.green,), AutoSizeText("  " + AppLocalizations.of(context).translate("updateRecentVersion"), group: checkPopupGroup, style: TextStyle(fontSize: MediaQuery.of(context).size.width * .05, fontWeight: FontWeight.w600), maxLines: 1, minFontSize: 1,),],);
          }
          Widget apiWidget;
          if (api == true) {
            apiWidget = Row(children: <Widget>[Icon(Icons.circle, color: Colors.red,), AutoSizeText("  " + AppLocalizations.of(context).translate("updateOutdatedApi"), group: checkPopupGroup, style: TextStyle(fontSize: MediaQuery.of(context).size.width * .05, fontWeight: FontWeight.w600), maxLines: 1, minFontSize: 1,),],);
          } else {
            apiWidget = Row(children: <Widget>[Icon(Icons.circle, color: Colors.green,), AutoSizeText("  " + AppLocalizations.of(context).translate("updateRecentVersion"), group: checkPopupGroup, style: TextStyle(fontSize: MediaQuery.of(context).size.width * .05, fontWeight: FontWeight.w600), maxLines: 1, minFontSize: 1,),],);
          }

          String footer() {
            if (version == true || api == true) {
              return AppLocalizations.of(context).translate("updateOutdated");
            } else {
              return AppLocalizations.of(context).translate("updateUptodate");
            }
          }

          return Material(child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .08),
          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .04), child: AutoSizeText(AppLocalizations.of(context).translate("updateTitle"), style: TextStyle(fontSize: MediaQuery.of(context).size.width * .06, fontWeight: FontWeight.w600), maxLines: 1, minFontSize: 1,),),
    Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .04), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[versionWidget, apiWidget]),
    ),AutoSizeText(footer(), style: TextStyle(fontSize: MediaQuery.of(context).size.width * .06, fontWeight: FontWeight.w600), maxLines: 1, minFontSize: 1,),],),
          ),
          );
  }
}
