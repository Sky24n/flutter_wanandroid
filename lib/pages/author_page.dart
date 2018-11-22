import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/utils/navigator_util.dart';

class AuthorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('关于作者'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new Material(
              color: Colors.white,
              child: new ListTile(
                onTap: () {},
                title: new Text(
                  '您的Star就是我的动力',
                  style: new TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                //dense: true,
              ),
            ),
            decoration: Decorations.bottom,
          ),
          new Container(
            child: new Material(
              color: Colors.white,
              child: new ListTile(
                onTap: () {
                  NavigatorUtil.launchInBrowser('https://github.com/Sky24n',
                      title: 'Github');
                },
                title: new Text('Github'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Go Follow',
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
                  NavigatorUtil.launchInBrowser(
                      'https://www.jianshu.com/u/cbf2ad25d33a',
                      title: '简书');
                },
                title: new Text('简书'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      '+关注',
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
                  NavigatorUtil.launchInBrowser(
                      'https://github.com/Sky24n/common_utils',
                      title: 'Dart 常用工具类库');
                },
                title: new Text('Dart 常用工具类库'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      '',
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
                  NavigatorUtil.launchInBrowser(
                      'https://github.com/flutterchina/lpinyin',
                      title: 'Flutter 汉字转拼音');
                },
                title: new Text('Flutter 汉字转拼音'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      '',
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
                  NavigatorUtil.launchInBrowser(
                      'https://github.com/flutterchina/flukit',
                      title: 'Flutter 城市列表索引&悬停');
                },
                title: new Text('Flutter 城市列表索引&悬停'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      '',
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
                  NavigatorUtil.launchInBrowser(
                      'https://github.com/Sky24n/flustars',
                      title: 'Flutter 常用工具类库');
                },
                title: new Text('Flutter 常用工具类库'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      '',
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
                  NavigatorUtil.launchInBrowser(
                      'https://github.com/Sky24n/fluintl',
                      title: 'Flutter 国际化/多语言');
                },
                title: new Text('Flutter 国际化/多语言'),
                //dense: true,
                trailing: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      '',
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
        ],
      ),
    );
  }
}
