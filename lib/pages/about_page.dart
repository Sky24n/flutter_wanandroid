import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/pages/page_index.dart';
import 'package:flutter_wanandroid/utils/utils.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(IntlUtil.getString(context, StringIds.titleAbout)),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 160.0,
              alignment: Alignment.center,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: new Image.asset(
                      Utils.getImgPath('ic_launcher_news'),
                      width: 72.0,
                      fit: BoxFit.fill,
                      height: 72.0,
                    ),
                  ),
                  new SizedBox(
                    height: 5,
                  ),
                  new Text(
                    '版本号 ' + AppConfig.version,
                    style: new TextStyle(color: ColorT.gray_99, fontSize: 14.0),
                  )
                ],
              ),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  border: new Border.all(width: 0.33, color: ColorT.divider))),
          new Container(
            child: new Material(
              color: Colors.white,
              child: new ListTile(
                onTap: () {
                  NavigatorUtil.launchInBrowser(
                      'https://github.com/Sky24n/flutter_wanandroid',
                      title: 'WanAn GitHub');
                },
                title: new Text('GitHub'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Go Star',
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    new Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            decoration: Decorations.bottom,
          ),
          new Container(
            child: new Material(
              color: Colors.white,
              child: new ListTile(
                onTap: () {
                  NavigatorUtil.push(context, (ctx) => new AuthorPage(),
                      pageName: StringIds.titleAuthor);
                },
                title: new Text('作者'),
                //dense: true,
                trailing: new Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                ),
              ),
            ),
            decoration: Decorations.bottom,
          ),
          new Container(
            child: new Material(
              color: Colors.white,
              child: new ListTile(
                onTap: () {
                },
                title: new Text('版本更新'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text('已是最新版',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0),
                    ),
                    new Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            decoration: Decorations.bottom,
          ),
          new Container(
            child: new Material(
              color: Colors.white,
              child: new ListTile(
                onTap: () {
                  NavigatorUtil.push(context, (ctx) => new OtherPage(),
                      pageName: 'OtherPage');
                },
                title: new Text('其他'),
                //dense: true,
                trailing: new Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                ),
              ),
            ),
            decoration: Decorations.bottom,
          ),
        ],
      ),
    );
  }
}
