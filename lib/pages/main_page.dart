import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/pages/page_index.dart';

class _Page {
  final String labelId;

  _Page(this.labelId);
}

final List<_Page> _allPages = <_Page>[
  new _Page(StringIds.titleHome),
  new _Page(StringIds.titleRepos),
  new _Page(StringIds.titleEvents),
  new _Page(StringIds.titleSystem),
];

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    NavigatorUtil.push(context, (ctx) => SearchPage());
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
  Widget _buildTabView(_Page page) {
    return new Builder(builder: (BuildContext context) {
      return new Container(
          key: new ValueKey<String>(IntlUtil.getString(context, page.labelId)),
          child: new Center(
              child: new Text(IntlUtil.getString(context, page.labelId),
                  style: new TextStyle(fontSize: 32.0),
                  textAlign: TextAlign.center)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarView(children: _allPages.map(_buildTabView).toList());
  }
}
