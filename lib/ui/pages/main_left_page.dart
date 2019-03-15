import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/demos/main_demos.dart';
import 'package:flutter_wanandroid/ui/pages/page_index.dart';

class MainLeftPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainLeftPageState();
  }
}

class PageInfo {
  PageInfo(this.titleId, this.iconData, this.page, [this.withScaffold = true]);

  String titleId;
  IconData iconData;
  Widget page;
  bool withScaffold;
}

class _MainLeftPageState extends State<MainLeftPage> {
  List<PageInfo> _pageInfo = new List();

  @override
  void initState() {
    super.initState();
    _pageInfo.add(
        PageInfo(Ids.titleCollection, Icons.collections, CollectionPage()));
    _pageInfo.add(PageInfo(Ids.titleSetting, Icons.settings, SettingPage()));
    _pageInfo.add(PageInfo(Ids.titleAbout, Icons.info, AboutPage()));
    _pageInfo.add(PageInfo(Ids.titleShare, Icons.share, SharePage()));
    _pageInfo.add(PageInfo(Ids.titleSignOut, Icons.power_settings_new, null));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().statusBarHeight, left: 10.0),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              Utils.getImgPath('ali_connors'),
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
          new Container(
            height: 50.0,
            child: new Material(
              color: Colors.grey[200],
              child: new InkWell(
                onTap: () {
                  NavigatorUtil.pushPage(context, MainDemosPage(),
                      pageName: "Flutter Demos");
                },
                child: new Center(
                  child: new Text(
                    "Flutter Demos",
                    style: new TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16.0),
                  ),
                ),
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
                    title:
                        new Text(IntlUtil.getString(context, pageInfo.titleId)),
                    onTap: () {
                      if (pageInfo.titleId != Ids.titleSignOut) {
                        NavigatorUtil.pushPage(context, pageInfo.page,
                            pageName: pageInfo.titleId);
                      } else {}
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
