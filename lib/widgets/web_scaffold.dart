import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/pages/page_index.dart';

class WebScaffold extends StatefulWidget {
  const WebScaffold({
    Key key,
    this.title,
    this.titleId,
    this.url,
  }) : super(key: key);

  final String title;
  final String titleId;
  final String url;

  @override
  State<StatefulWidget> createState() {
    return new WebScaffoldState();
  }
}

class WebScaffoldState extends State<WebScaffold> {
  final GlobalKey<WebviewScaffoldState> _webScaffoldKey =
      new GlobalKey<WebviewScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      key: _webScaffoldKey,
      appBar: new AppBar(
        title: new InkWell(
            onDoubleTap: () {
              _webScaffoldKey.currentState.scrollToTop();
            },
            child: new Text(
              widget.title ?? IntlUtil.getString(context, widget.titleId),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      url: widget.url,
    );
  }
}
