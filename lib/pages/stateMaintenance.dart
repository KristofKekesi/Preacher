import 'dart:ui';

import 'package:Preacher/localization.dart';
import 'package:Preacher/widgets/optimizedImages.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../meta.dart';

class MaintenancePage extends StatelessWidget {
  final String title;
  final color;
  final String extension;
  final String backgroundPre;
  final List backgroundOptions;
  final Widget action;

  MaintenancePage(this.title, this.color, this.extension, this.backgroundPre, this.backgroundOptions, this.action);

  double openButtonOpacity() {
    if (developerMode == true) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: Stack(
            children: <Widget>[
              Center(child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width * .1,), child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .1,),child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      (MediaQuery.of(context).size.height +
                          MediaQuery.of(context).size.width) /
                          2 *
                          .03),
                  child: Container(width: MediaQuery.of(context).size.width * .4, height: MediaQuery.of(context).size.width * .4, decoration: BoxDecoration(image: DecorationImage(
                    image: NetworkImage(apiUrl + backgroundPre + optimizedImages(backgroundOptions, MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.width * .4)),
                    fit: BoxFit.cover,
                  ),color: Color(int.parse(color))), child:
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Icon(Icons.access_time, color: Colors.black, size: MediaQuery.of(context).size.width * .27,),
                      BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: (MediaQuery.of(context)
                                .size
                                .height +
                                MediaQuery.of(context)
                                    .size
                                    .width) /
                                2 *
                                .02,
                            sigmaY: (MediaQuery.of(context)
                                .size
                                .height +
                                MediaQuery.of(context)
                                    .size
                                    .width) /
                                2 *
                                .02),
                        child: Icon(Icons.access_time, color: Colors.white, size: MediaQuery.of(context).size.width * .27,),),
                    ],
                  ),),
                ),),
                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .03,),child: AutoSizeText(AppLocalizations.of(context).translate("maintenanceStateTitle"), style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * .08,
                  fontWeight: FontWeight.bold,
                ),),),
                AutoSizeText(AppLocalizations.of(context).translate("maintenanceStateSubTitle"),  style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * .05,
                ), maxLines: 4, minFontSize: 1,),
              ],),),),
        IgnorePointer(ignoring: !developerMode, child: Opacity(opacity: openButtonOpacity(), child: GestureDetector(onTap: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => action,),
              );}, child: Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * .05), child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)), child: Container(decoration: BoxDecoration(image: DecorationImage(
        image: NetworkImage(apiUrl + backgroundPre + optimizedImages(backgroundOptions, MediaQuery.of(context).size.width * .15, MediaQuery.of(context).size.width * .5)),
        fit: BoxFit.fill,
        ),color: Color(int.parse(color))), child: Container(height: MediaQuery.of(context).size.width * .15, width: MediaQuery.of(context).size.width * .5, decoration: BoxDecoration(), child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: (MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.width) /
                        2 *
                        .03,
                    sigmaY: (MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.width) /
                        2 *
                        .03),
                child: Center(child: AutoSizeText(AppLocalizations.of(context).translate("developerOpenAnyway"), style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.width * .05,
        ), maxLines: 1, minFontSize: 1,),),),),),),),),),),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: ClipRect(child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: (MediaQuery.of(context)
                          .size
                          .height +
                          MediaQuery.of(context)
                              .size
                              .width) /
                          2 *
                          .02,
                      sigmaY: (MediaQuery.of(context)
                          .size
                          .height +
                          MediaQuery.of(context)
                              .size
                              .width) /
                          2 *
                          .02),
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
                        GestureDetector(onTap: (){Navigator.pop(context);}, child: Tooltip(message: AppLocalizations.of(context).translate("back"), child: Icon(Icons.chevron_left, size: MediaQuery.of(context).size.width * .08, color: Colors.black,),),),
                        Expanded(child: AutoSizeText(
                          " " + title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * .08,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 1,
                          maxLines: 1,
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
}