import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class ComArrowItem extends StatelessWidget {
  const ComArrowItem(this.model, {Key key}) : super(key: key);
  final ComModel model;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Material(
        color: Colors.white,
        child: new ListTile(
          onTap: () {
            if (model.page == null) {
              NavigatorUtil.pushWeb(context,
                  title: model.title, url: model.url, isHome: true);
            } else {
              NavigatorUtil.pushPage(context, model.page,
                  pageName: model.title);
            }
          },
          title: new Text(model.title == null ? "" : model.title),
          trailing: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                model.extra == null ? "" : model.extra,
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              new Icon(
                Icons.navigate_next,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      decoration: Decorations.bottom,
    );
  }
}
