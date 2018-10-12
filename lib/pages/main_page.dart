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

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _controller;

  _Page _selectedPage;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: _allPages.length);
    _controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _selectedPage = _allPages[_controller.index];
    });
  }

  Widget buildTabView(_Page page) {
    return new Builder(builder: (BuildContext context) {
      return new Container(
          key: new ValueKey<String>(
              CustomLocalizations.instance.getString(page.labelId)),
          child: new Center(
              child: new Text(
                  CustomLocalizations.instance.getString(page.labelId),
                  style: new TextStyle(fontSize: 32.0),
                  textAlign: TextAlign.center)));
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    CustomLocalizations.init(context);

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        leading: new InkWell(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: new Container(
            width: kToolbarHeight,
            height: kToolbarHeight,
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: const AssetImage(
                  "assets/images/ali_connors.png",
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: new Container(
          height: kToolbarHeight,
          child: new TabBar(
            controller: _controller,
            isScrollable: true,
            labelStyle: new TextStyle(fontSize: 12.0),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _allPages
                .map((_Page page) => new Tab(
                    text: CustomLocalizations.instance.getString(page.labelId)))
                .toList(),
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                NavigatorUtil.push(context, (ctx) => SearchPage());
              })
        ],
      ),
      body: new TabBarView(
          controller: _controller,
          children: _allPages.map(buildTabView).toList()),
      drawer: new Drawer(
        child: new MainLeftPage(),
      ),
    );
  }
}
