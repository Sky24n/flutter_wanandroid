import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  void _initAsync() async {
    await SpUtil.getInstance(); //等待Sp初始化完成
    SpUtil.putString("username", "sky224");
    String username = SpUtil.getString("username");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SpUtilPage(""),
    );
  }
}

class SpUtilPage extends StatefulWidget {
  final String title;

  SpUtilPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return new SpUtilPageState();
  }
}

class SpUtilPageState extends State<SpUtilPage> {
  @override
  void initState() {
    super.initState();
    SpUtil.putString("username", "sky24");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
      body: new Scaffold(
        body: new Center(
          child: new Text("username: " + SpUtil.getString("username")),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          String username = SpUtil.getString("username"); //同步获取
        }),
      ),
    );
  }
}
