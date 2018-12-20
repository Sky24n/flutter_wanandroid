import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  final String title;

  WidgetPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return new _WidgetPageState();
  }
}

class _WidgetPageState extends State<WidgetPage> {
  double testHeight = 50.0;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          centerTitle: true,
        ),
        body: new Stack(
          children: <Widget>[
            new Container(
              child: new Center(
                child: new Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new TestPage(testHeight),
                ),
              ),
            ),
            new Container(
              child: new TestPage2(),
              margin: EdgeInsets.all(10.0),
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            setState(() {
              isOpen = !isOpen;
              testHeight = isOpen ? 100.0 : 50.0;
            });
          },
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ));
  }
}

class TestPage extends StatefulWidget {
  final double _height;

  TestPage(this._height);

  @override
  State<StatefulWidget> createState() {
    return new _TestPageState();
  }
}

class _TestPageState extends State<TestPage> {
  WidgetUtil widgetUtil = new WidgetUtil();
  String mCenterTxt = "";

  @override
  Widget build(BuildContext context) {
    widgetUtil.asyncPrepare(context, false, (Rect rect) {
      setState(() {
        mCenterTxt = "width: " +
            rect.width.toString() +
            "\n" +
            "height: " +
            rect.height.toString();
      });
    });
    return Container(
      height: widget._height,
      color: Colors.cyan[200],
      child: new Center(child: new Text(mCenterTxt)),
    );
  }
}

class TestPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestPage2State();
  }
}

class _TestPage2State extends State<TestPage2> {
  String defText = "点击获取Widget在屏幕上的坐标";
  String contentText = "";

  @override
  Widget build(BuildContext context) {
    if (contentText == "") {
      contentText = defText;
    }
    return new Container(
      height: 100.0,
      color: Colors.cyan[100],
      child: new InkWell(
        onTap: () {
          setState(() {
            Offset offset = WidgetUtil.getWidgetLocalToGlobal(context);
            contentText = defText + "\n" + "Offset: " + offset.toString();
          });
        },
        child: new Center(
          child: new Text(contentText),
        ),
      ),
    );
  }
}
