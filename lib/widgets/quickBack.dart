// import 'package:flutter/material.dart';
//
//
//
// class QuickBack extends StatelessWidget {
//   final List images;
//   final String title;
//   final Widget child;
//
//   QuickBack({Key key, this.images, this.title, this.child})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<CupertinoContextMenuAction> finalOptions = [];
//
//     for (int index = 0; index < quickBack.length; index++){
//       finalOptions.add(CupertinoContextMenuAction(
//         child: Text(quickBack[index]),
//         onPressed: () {
//           for (int innerIndex = 0; innerIndex < quickBack.length - index + 1; innerIndex++) {
//             QuickBackRemoveLast();
//             Navigator.pop(context);
//           }
//         },));
//     }
//
//     return CupertinoContextMenu(
//       previewBuilder: (BuildContext context, Animation<double> animation,
//           Widget child) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(
//               (MediaQuery
//                   .of(context)
//                   .size
//                   .height +
//                   MediaQuery
//                       .of(context)
//                       .size
//                       .width) /
//                   2 *
//                   .03),
//           child: Stack(children: <Widget>[
//             Image(image: NetworkImage(
//                 "https://api.kekesi.dev/Preacher/v1/book/hu-HU/Karoli2014/500x325.png"),),
//
//           ],
//           ),);
//       },
//       actions:
//         finalOptions, child: child,
//     );
//   }
// }