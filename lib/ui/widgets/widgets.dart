import 'package:base_library/base_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/blocs/bloc_index.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:flutter_wanandroid/ui/pages/user/user_login_page.dart';
import 'package:flutter_wanandroid/utils/util_index.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: 24.0,
        height: 24.0,
        child: new CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}

class LikeBtn extends StatelessWidget {
  const LikeBtn({
    Key key,
    this.labelId,
    this.id,
    this.isLike,
  }) : super(key: key);
  final String labelId;
  final int id;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    return new InkWell(
      onTap: () {
        if (Util.isLogin()) {
          bloc.doCollection(labelId, id, !isLike);
        } else {
          NavigatorUtil.pushPage(context, UserLoginPage(),
              pageName: "UserLoginPage");
        }
      },
      child: new Icon(
        Icons.favorite,
        color: (isLike == true && Util.isLogin())
            ? Colors.redAccent
            : Colours.gray_99,
      ),
    );
  }
}

class StatusViews extends StatelessWidget {
  const StatusViews(this.status, {Key key, this.onTap}) : super(key: key);
  final int status;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadStatus.fail:
        return new Container(
          width: double.infinity,
          child: new Material(
            color: Colors.white,
            child: new InkWell(
              onTap: () {
                onTap();
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    Utils.getImgPath("ic_network_error"),
                    package: BaseConstant.packageBase,
                    width: 100,
                    height: 100,
                  ),
                  Gaps.vGap10,
                  new Text(
                    "网络出问题了～ 请您查看网络设置",
                    style: TextStyles.listContent,
                  ),
                  Gaps.vGap5,
                  new Text(
                    "点击屏幕，重新加载",
                    style: TextStyles.listContent,
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      case LoadStatus.loading:
        return new Container(
          alignment: Alignment.center,
          color: Colours.gray_f0,
          child: new ProgressView(),
        );
        break;
      case LoadStatus.empty:
        return new Container(
          color: Colors.white,
          width: double.infinity,
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  Utils.getImgPath("ic_data_empty"),
                  package: BaseConstant.packageBase,
                  width: 60,
                  height: 60,
                ),
                Gaps.vGap10,
                new Text(
                  "空空如也～",
                  style: TextStyles.listContent2,
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }
}
