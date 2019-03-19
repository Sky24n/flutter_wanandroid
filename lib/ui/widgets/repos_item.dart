import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class ReposItem extends StatelessWidget {
  const ReposItem(
    this.model, {
    Key key,
    this.isHome,
  }) : super(key: key);

  final ReposModel model;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        NavigatorUtil.pushWeb(context,
            title: model.title, url: model.link, isHome: isHome);
      },
      child: new Container(
          height: 160.0,
          padding: EdgeInsets.all(16.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.listTitle,
                  ),
                  Gaps.vGap10,
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      model.desc,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.listContent,
                    ),
                  ),
                  Gaps.vGap5,
                  new Row(
                    children: <Widget>[
                      new Text(
                        model.author,
                        style: TextStyles.listExtra,
                      ),
                      Gaps.hGap10,
                      new Text(
                        Utils.getTimeLine(context, model.publishTime),
                        style: TextStyles.listExtra,
                      ),
                    ],
                  )
                ],
              )),
              new Container(
                width: 72,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10.0),
                child: new CachedNetworkImage(
                  width: 72,
                  height: 128,
                  fit: BoxFit.fill,
                  imageUrl: model.envelopePic,
                  placeholder: (context, url) => new ProgressView(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              )
            ],
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(
                  bottom: new BorderSide(width: 0.33, color: Colours.divider)))),
    );
  }
}
