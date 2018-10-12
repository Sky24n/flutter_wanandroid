import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class NavigatorUtil {
  static void push(BuildContext context, WidgetBuilder builder,
      {ValueChanged<String> whenComplete}) {
    if (context == null || builder == null) return;
    Navigator.push(context, new CupertinoPageRoute<void>(builder: builder))
        .whenComplete(() {
      if (whenComplete != null) {
        whenComplete(null);
      }
    });
  }
}
