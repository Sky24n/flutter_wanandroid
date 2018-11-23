import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wanandroid/pages/page_index.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigatorUtil {
  static void push(BuildContext context, WidgetBuilder builder,
      {String pageName, ValueChanged<String> whenComplete}) {
    if (context == null || builder == null) return;
    Navigator.push(context, new CupertinoPageRoute<void>(builder: builder))
        .whenComplete(() {
      if (whenComplete != null) {
        whenComplete(null);
      }
    });
  }

  static void pushWeb(BuildContext context,
      {String title, String titleId, String url, bool isHome: false}) {
    if (context == null || url == null) return;
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new WebScaffold(
                  title: title,
                  titleId: titleId,
                  url: url,
                )));
  }

  static Future<Null> launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
