import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/src/scheduler/ticker.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  static const MaterialColor appMainColor = MaterialColor(
    _appMainColor,
    <int, Color>{
      500: Color(_appMainColor),
    },
  );
  static const int _appMainColor = 0xFF333333;

  @override
  Widget build(BuildContext context) {
    // MaterialColor.
    return new MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF333333),
        indicatorColor: Colors.white,
        splashFactory: InkRipple.splashFactory,
        platform: TargetPlatform.android,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _Page {
  final String label;

  _Page(this.label);
}

final List<_Page> _allPages = <_Page>[
  new _Page('主页'),
  new _Page('项目'),
  new _Page('动态'),
  new _Page('体系'),
//  new _Page('导航'),
];

class _MyHomePageState extends State<MyHomePage> implements TickerProvider {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Ticker _ticker;

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
    assert(() {
      if (_ticker == null || !_ticker.isActive) return true;
      throw new FlutterError('$this was disposed with an active Ticker.\n'
          '$runtimeType created a Ticker via its SingleTickerProviderStateMixin, but at the time '
          'dispose() was called on the mixin, that Ticker was still active. The Ticker must '
          'be disposed before calling super.dispose(). Tickers used by AnimationControllers '
          'should be disposed by calling dispose() on the AnimationController itself. '
          'Otherwise, the ticker will leak.\n'
          'The offending ticker was: ${_ticker.toString(debugIncludeStack: true)}');
    }());
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
          key: new ValueKey<String>(page.label),
          child: new Center(
              child: new Text(page.label,
                  style: new TextStyle(fontSize: 32.0),
                  textAlign: TextAlign.center)));
    });
  }

  @override
  Widget build(BuildContext context) {
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
        title: new TabBar(
          controller: _controller,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          tabs:
              _allPages.map((_Page page) => new Tab(text: page.label)).toList(),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                LogUtil.e("");
              })
        ],
      ),
      body: new TabBarView(
          controller: _controller,
          children: _allPages.map(buildTabView).toList()),
      drawer: new Drawer(
        child: new Material(
          child: new Container(
            width: 200.0,
          ),
        ),
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    assert(() {
      if (_ticker == null) return true;
      throw new FlutterError(
          '$runtimeType is a SingleTickerProviderStateMixin but multiple tickers were created.\n'
          'A SingleTickerProviderStateMixin can only be used as a TickerProvider once. If a '
          'State is used for multiple AnimationController objects, or if it is passed to other '
          'objects and those objects might use it more than one time in total, then instead of '
          'mixing in a SingleTickerProviderStateMixin, use a regular TickerProviderStateMixin.');
    }());
    _ticker = new Ticker(onTick, debugLabel: 'created by $this');
    // We assume that this is called from initState, build, or some sort of
    // event handler, and that thus TickerMode.of(context) would return true. We
    // can't actually check that here because if we're in initState then we're
    // not allowed to do inheritance checks yet.
    return _ticker;
  }
}
