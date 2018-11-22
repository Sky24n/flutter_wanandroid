import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class CollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(IntlUtil.getString(context, StringIds.titleCollection)),
        centerTitle: true,
      ),
      body: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}
