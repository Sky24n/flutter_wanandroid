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
  PageInfo loginOut =
      PageInfo(Ids.titleSignOut, Icons.power_settings_new, null);
  String _userName;

  @override
  void initState() {
    super.initState();
    _pageInfo.add(PageInfo(
      Ids.titleCollection,
      Icons.collections,
      new CollectionPage(
        labelId: Ids.titleCollection,
      ),
    ));
    _pageInfo.add(PageInfo(Ids.titleSetting, Icons.settings, SettingPage()));
    _pageInfo.add(PageInfo(Ids.titleAbout, Icons.info, AboutPage()));
    _pageInfo.add(PageInfo(Ids.titleShare, Icons.share, SharePage()));
  }

  void _showLoginOutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Text(
              "确定退出吗？",
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  IntlUtil.getString(ctx, Ids.cancel),
                  style: TextStyles.listExtra2,
                ),
                onPressed: () {
                  Navigator.pop(ctx);
                },
              ),
              FlatButton(
                child: Text(
                  IntlUtil.getString(ctx, Ids.confirm),
                  style: TextStyles.listExtra,
                ),
                onPressed: () {
                  SpUtil.remove(BaseConstant.keyAppToken);
                  Event.sendAppEvent(context, Constant.type_sys_update);
                  Navigator.pop(ctx);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (Util.isLogin()) {
      if (!_pageInfo.contains(loginOut)) {
        _pageInfo.add(loginOut);
        UserModel userModel = SpUtil.getObj(
            BaseConstant.keyUserModel, (v) => UserModel.fromJson(v));
        _userName = userModel?.username ?? "";
        LogUtil.e("_userName : $_userName");
      }
    } else {
      _userName = "Sky24n";
      if (_pageInfo.contains(loginOut)) {
        _pageInfo.remove(loginOut);
      }
    }

    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            height: 166.0,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().statusBarHeight, left: 10.0),
            child: new Stack(
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
                      _userName,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Gaps.vGap5,
                    new Text(
                      "个人简介",
                      style: new TextStyle(color: Colors.white, fontSize: 12.0),
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
                    title: Text(IntlUtil.getString(context, pageInfo.titleId)),
                    onTap: () {
                      if (pageInfo.titleId == Ids.titleSignOut) {
                        _showLoginOutDialog(context);
                      } else if (pageInfo.titleId == Ids.titleCollection) {
                        NavigatorUtil.pushPage(
                            context,
                            BlocProvider<CollectBloc>(
                              child: pageInfo.page,
                              bloc: new CollectBloc(),
                            ),
                            pageName: pageInfo.titleId,
                            needLogin: Utils.isNeedLogin(pageInfo.titleId));
                      } else {
                        NavigatorUtil.pushPage(context, pageInfo.page,
                            pageName: pageInfo.titleId,
                            needLogin: Utils.isNeedLogin(pageInfo.titleId));
                      }
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
