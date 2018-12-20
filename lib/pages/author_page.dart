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
                      'https://www.jianshu.com/p/9e5cc4ba3a8e',
                      title: '我的Flutter开源库集合');
                },
                title: new Text('我的Flutter开源库集合'),
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
