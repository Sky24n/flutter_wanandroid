import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('其他'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new Material(
              color: Colors.white,
              child: new ListTile(
                onTap: () {
                  NavigatorUtil.launchInBrowser('http://www.wanandroid.com',
                      title: 'WanAndroid Api');
                },
                title: new Text('WanAndroid Api'),
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
                  NavigatorUtil.launchInBrowser(
                      'https://flutterchina.club/app/gm.html',
                      title: '界面参考Gitme');
                },
                title: new Text('界面参考Gitme'),
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
