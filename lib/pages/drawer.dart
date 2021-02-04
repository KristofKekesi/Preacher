import 'package:Preacher/meta.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../localization.dart';

// ignore: non_constant_identifier_names
String Capitalizate(input) {
  return input[0].toUpperCase() + input.substring(1);
}

class SideDrawer extends StatelessWidget {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  int tapCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      child: Drawer(
        child: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
      overscroll.disallowGlow();
      },child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .2,
              child: DrawerHeader(
                child: null,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/img/loader.png'),
                      fit: BoxFit.fitWidth),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .03),
              child: GestureDetector(
                onTap: () {
                  _launchURL(
                      'https://github.com/KristofKekesi/Preacher#contributors-');
                },
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context).translate('drawerContributors'),
                    //AppLocalizations.of(context).translate('contributors'),
                    style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .07),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchURL(
                    'https://github.com/KristofKekesi/Preacher#contacts-');
              },
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context).translate('drawerContacts'),
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .07),
                ),
              ),
            ),
            Divider(
              thickness: MediaQuery.of(context).size.height * .005,
            ),
            GestureDetector(
              onTap: () {
                _launchURL(
                    'https://github.com/KristofKekesi/Preacher#license-');
              },
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context).translate('drawerLicense'),
                  //AppLocalizations.of(context).translate('license'),
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .07),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                autoAboutDialog(context);
              },
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context).translate('drawerMore'),
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize:
                      MediaQuery.of(context).size.width * .07),),),),
            GestureDetector(
              onTap: () {
                _launchURL(
                    'https://forms.gle/izZacNgKhT833WKu9');
              },
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context).translate('drawerFeedback'),
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .07),
                ),
              ),
            ),
            Divider(
              thickness: MediaQuery.of(context).size.height * .005,
            ),
            ListTile(
              title: GestureDetector(onTap: (){
                if (tapCounter == 16) {developerMode = true;} else {tapCounter++;}
              }, child: Text(
                Capitalizate(
                  ' [' +
                      AppLocalizations.of(context).translate('key') +
                      ']',),
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .05),
              ),
            ),),
          ],
        ),
      ),),
    );
  }
}

void autoAboutDialog(context) {
  showAboutDialog(
    context: context,
    applicationVersion: '1.0.1',
    applicationName: 'Preacher',
    applicationLegalese: 'Kristóf Kékesi',
    children: [
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .05,
            left: MediaQuery.of(context).size.height * .04,
            right: MediaQuery.of(context).size.height * .04,
        ),
        child: Column(children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('drawerSpecial'),
        ),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .02), child: Image(image: AssetImage('lib/img/egg.png'), width: MediaQuery.of(context).size.width * .92, fit: BoxFit.fitWidth,),
          ),],
        ),
      ),
    ],
  );
}