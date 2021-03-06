import 'dart:ui';

import 'package:Preacher/widgets/directory.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../localization.dart';

class Directory extends StatelessWidget {
  final String title;
  final String color;
  final String extension;
  final String backgroundPre;
  final List backgroundOptions;

  const Directory(this.title, this.color, this.extension, this.backgroundPre, this.backgroundOptions);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: Stack(
            children: <Widget>[
              BuildDirectory(title: title, extension: extension, color: color, padding: MediaQuery.of(context).size.width * .1, backgroundPre: backgroundPre, backgroundOptions: backgroundOptions,),
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