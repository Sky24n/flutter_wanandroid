import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem(
      {this.margin,
      this.titleColor,
      this.leftIcon,
      this.titleId: Ids.titleRepos,
      this.title,
      this.extraId: Ids.more,
      this.extra,
      this.rightIcon,
      this.onTap,
      Key key})
      : super(key: key);

  final EdgeInsetsGeometry margin;
  final Color titleColor;
  final IconData leftIcon;
  final String titleId;
  final String title;
  final String extraId;
  final String extra;
  final IconData rightIcon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      margin: margin ?? EdgeInsets.only(top: 0.0),
      child: new ListTile(
          onTap: onTap,
          title: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(
                leftIcon ?? Icons.whatshot,
                color: titleColor ?? Colors.blueAccent,
              ),
              Gaps.hGap10,
              new Expanded(
                  child: new Text(
                title ?? IntlUtil.getString(context, titleId),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: titleColor ?? Colors.blueAccent,
                    fontSize: Utils.getTitleFontSize(
                        title ?? IntlUtil.getString(context, titleId))),
              ))
            ],
          ),
          trailing: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                extra ?? IntlUtil.getString(context, extraId),
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              new Icon(
                rightIcon ?? Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ],
          )),
      decoration: new BoxDecoration(
          //new Border.all(width: 0.33, color: Colours.divider)
          border: new Border(
              bottom: new BorderSide(width: 0.33, color: Colours.divider))),
    );
  }
}
