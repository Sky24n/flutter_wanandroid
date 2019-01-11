import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/ui/pages/main_left_page.dart';
import 'package:flutter_wanandroid/ui/pages/page_index.dart';

class _Page {
  final String labelId;

  _Page(this.labelId);
}

final List<_Page> _allPages = <_Page>[
  new _Page(Ids.titleHome),
  new _Page(Ids.titleRepos),
  new _Page(Ids.titleEvents),
  new _Page(Ids.titleSystem),
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogUtil.e("MainPagess build......");
    return new DefaultTabController(
        length: _allPages.length,
        child: new Scaffold(
          appBar: new MyAppBar(
            leading: new Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    Utils.getImgPath('ali_connors'),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            title: new TabLayout(),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.search),
                  onPressed: () {
                    NavigatorUtil.pushPage(context, new SearchPage(),
                        pageName: "SearchPage");
                    // NavigatorUtil.pushPage(context,  new TestPage());
                    //  NavigatorUtil.pushPage(context,  new DemoApp());
                  })
            ],
          ),
          body: new TabBarViewLayout(),
          drawer: new Drawer(
            child: new MainLeftPage(),
          ),
        ));
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _allPages
          .map((_Page page) =>
              new Tab(text: IntlUtil.getString(context, page.labelId)))
          .toList(),
    );
  }
}

class TabBarViewLayout extends StatelessWidget {
  Widget buildTabView(BuildContext context, _Page page) {
    String labelId = page.labelId;
    switch (labelId) {
      case Ids.titleHome:
        return HomePage(labelId: labelId);
        break;
      case Ids.titleRepos:
        return ReposPage(labelId: labelId);
        break;
      case Ids.titleEvents:
        return EventsPage(labelId: labelId);
        break;
      case Ids.titleSystem:
        return SystemPage(labelId: labelId);
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e("TabBarViewLayout build.......");
    return new TabBarView(
        children: _allPages.map((_Page page) {
      return buildTabView(context, page);
    }).toList());
  }
}
