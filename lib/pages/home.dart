import 'dart:ui';
import 'package:Preacher/widgets/latest.dart';
import 'package:Preacher/widgets/status.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../localization.dart';
import 'drawer.dart';
import 'package:Preacher/widgets/languages.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 0, child: Container(
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
            AutoSizeText(" " + AppLocalizations.of(context).translate('homeTitle'), textAlign: TextAlign.left,
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
    );
  }

}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// ignore: must_be_immutable
class _HomeState extends State<Home> {
  Size headerSize;

  void initState() {
    super.initState();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => check(context, "meta.json"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      body: Builder(builder: (context) {
        return SafeArea(
          child: Stack(
            children: <Widget>[
            NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
        },child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeHeader(),
          BuildLatest(),
          BuildLanguages("lang/book/data.json"),
        ],),),),

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
                        GestureDetector(
                          onTap: ()  {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Tooltip(
                            message: AppLocalizations.of(context).translate('homeMenuTooltip'),
                            child: Icon(Icons.menu, size: MediaQuery.of(context).size.width * .08, color: Colors.black,),
                          ),
                        ),
                        AutoSizeText(" " + AppLocalizations.of(context).translate('homeTitle'), textAlign: TextAlign.left,
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
              ),
            ],
          ),
        );
      },),
    );
  }
}