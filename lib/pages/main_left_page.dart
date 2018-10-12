import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/pages/page_index.dart';

class MainLeftPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainLeftPageState();
  }
}

class PageInfo {
  PageInfo(this.titleId, this.iconData, this.builder,
      [this.withScaffold = true]);

  String titleId;
  IconData iconData;
  WidgetBuilder builder;
  bool withScaffold;
}

class _MainLeftPageState extends LBaseState<MainLeftPage> {
  List<PageInfo> _pageInfo = new List();

  @override
  void initState() {
    super.initState();
    _pageInfo.add(PageInfo(
        StringIds.titleBookmarks, Icons.bookmark, (ctx) => SettingPage()));
    _pageInfo.add(PageInfo(
        StringIds.titleSetting, Icons.settings, (ctx) => SettingPage()));
    _pageInfo.add(
        PageInfo(StringIds.titleAbout, Icons.info, (ctx) => SettingPage()));
    _pageInfo.add(
        PageInfo(StringIds.titleShare, Icons.share, (ctx) => SettingPage()));
    _pageInfo.add(PageInfo(StringIds.titleSignOut, Icons.power_settings_new,
        (ctx) => SettingPage()));
  }

  @override
  Widget build(BuildContext context) {
    CustomLocalizations cl = CustomLocalizations.instance;
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            color: Theme.of(context).primaryColor,
            padding:
                EdgeInsets.only(top: ScreenUtil.statusBarHeight, left: 10.0),
            child: new SizedBox(
              height: 120.0,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        width: 64.0,
                        height: 64.0,
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: const AssetImage(
                              "assets/images/ali_connors.png",
                            ),
                          ),
                        ),
                      ),
                      new Text(
                        "Sky24n",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        "个人简介",
                        style:
                            new TextStyle(color: Colors.white, fontSize: 10.0),
                      ),
                    ],
                  ),
                  new Align(
                    alignment: Alignment.topRight,
                    child: new IconButton(
                        iconSize: 18.0,
                        icon: new Icon(Icons.edit, color: Colors.white),
                        onPressed: () {}),
                  )
                ],
              ),
            ),
          ),
          new Expanded(
            child: new ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: _pageInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  PageInfo pageInfo = _pageInfo[index];
                  return new ListTile(
                    leading: new Icon(pageInfo.iconData),
                    title: new Text(cl.getString(pageInfo.titleId)),
                    onTap: () {
                      NavigatorUtil.push(context, pageInfo.builder);
                    },
                  );
                }),
            flex: 1,
          )
        ],
      ),
    );
  }
}
