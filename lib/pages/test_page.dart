import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class MainLeftPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainLeftPageState();
  }
}

class _MainLeftPageState extends State<MainLeftPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: ScreenUtil.getInstance().statusBarHeight),
            child: new SizedBox(
              height: 120.0,
              width: double.infinity,
            ),
          ),
          new Expanded(
            child: new ListView(),
            flex: 1,
          )
        ],
      ),
    );
  }
}
