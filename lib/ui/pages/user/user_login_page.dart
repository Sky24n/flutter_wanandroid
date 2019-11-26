import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/data/repository/user_repository.dart';
import 'package:flutter_wanandroid/ui/pages/user/user_register_page.dart';

class UserLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            Util.getImgPath("ic_login_bg"),
            package: BaseConstant.packageBase,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          new LoginBody()
        ],
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();
    UserRepository userRepository = new UserRepository();
    UserModel userModel =
        SpUtil.getObj(BaseConstant.keyUserModel, (v) => UserModel.fromJson(v));
    _controllerName.text = userModel?.username ?? "";

    void _userLogin() {
      String username = _controllerName.text;
      String password = _controllerPwd.text;
      if (username.isEmpty || username.length < 6) {
        Util.showSnackBar(context, username.isEmpty ? "请输入用户名～" : "用户名至少6位～");
        return;
      }
      if (password.isEmpty || password.length < 6) {
        Util.showSnackBar(context, username.isEmpty ? "请输入密码～" : "密码至少6位～");
        return;
      }
      LoginReq req = new LoginReq(username, password);
      userRepository.login(req).then((UserModel model) {
        LogUtil.e("LoginResp: ${model.toString()}");
        Util.showSnackBar(context, "登录成功～");
        Observable.just(1).delay(new Duration(milliseconds: 500)).listen((_) {
          Event.sendAppEvent(context, Constant.type_refresh_all);
          RouteUtil.goMain(context);
        });
      }).catchError((error) {
        LogUtil.e("LoginResp error: ${error.toString()}");
        Util.showSnackBar(context, error.toString());
      });
    }

    return new Column(
      children: <Widget>[
        new Expanded(child: new Container()),
        new Expanded(
            child: new Container(
          margin: EdgeInsets.only(left: 20, top: 15, right: 20),
          child: new Column(
            children: <Widget>[
              LoginItem(
                controller: _controllerName,
                prefixIcon: Icons.person,
                hintText: IntlUtil.getString(context, Ids.user_name),
              ),
              Gaps.vGap15,
              LoginItem(
                controller: _controllerPwd,
                prefixIcon: Icons.lock,
                hasSuffixIcon: true,
                hintText: IntlUtil.getString(context, Ids.user_pwd),
              ),
              new Container(
                padding: EdgeInsets.only(top: Dimens.gap_dp15),
                alignment: Alignment.centerRight,
                child: new InkWell(
                  child: new Text(
                    IntlUtil.getString(context, Ids.user_forget_pwd),
                    style: new TextStyle(
                        color: Colours.gray_99, fontSize: Dimens.font_sp14),
                  ),
                  onTap: () {
                    Util.showSnackBar(context, "请联系管理员～");
                  },
                ),
              ),
              new RoundButton(
                text: IntlUtil.getString(context, Ids.user_login),
                margin: EdgeInsets.only(top: 20),
                onPressed: () {
                  _userLogin();
                },
              ),
              Gaps.vGap15,
              new InkWell(
                onTap: () {
                  NavigatorUtil.pushPage(context, new UserRegisterPage());
                },
                child: new RichText(
                    text: new TextSpan(children: <TextSpan>[
                  new TextSpan(
                      style:
                          new TextStyle(fontSize: 14, color: Colours.text_gray),
                      text:
                          IntlUtil.getString(context, Ids.user_new_user_hint)),
                  new TextSpan(
                      style: new TextStyle(
                          fontSize: 14, color: Theme.of(context).primaryColor),
                      text: IntlUtil.getString(context, Ids.user_register))
                ])),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
