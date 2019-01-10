import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/ui/widgets/widgets.dart';

class ComListView extends StatelessWidget {
  const ComListView(
      {Key key,
      this.isLoading: false,
      this.child,
      this.itemCount,
      this.itemBuilder})
      : super(key: key);

  final bool isLoading;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? new ListView(
            children: <Widget>[ProgressView()],
          )
        : child ??
            ListView.builder(itemCount: itemCount, itemBuilder: itemBuilder);
  }
}
