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
          // bloc.doCollection(labelId, id, !isLike);
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
