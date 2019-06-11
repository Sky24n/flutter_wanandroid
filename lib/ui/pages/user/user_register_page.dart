import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/data/repository/user_repository.dart';

class UserRegisterPage extends StatelessWidget {
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
          new UserRegisterBody()
        ],
      ),
    );
  }
}

class UserRegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();
    TextEditingController _controllerRePwd = new TextEditingController();
    UserRepository userRepository = new UserRepository();

    void _userRegister() {
      String username = _controllerName.text;
      String password = _controllerPwd.text;
      String passwordRe = _controllerRePwd.text;
      if (username.isEmpty || username.length < 6) {
        Util.showSnackBar(context, username.isEmpty ? "请输入用户名～" : "用户名至少6位～");
        return;
      }
      if (password.isEmpty || password.length < 6) {
        Util.showSnackBar(context, password.isEmpty ? "请输入密码～" : "密码至少6位～");
        return;
      }
      if (passwordRe.isEmpty || passwordRe.length < 6) {
        Util.showSnackBar(context, passwordRe.isEmpty ? "请确认输入密码～" : "密码至少6位～");
        return;
      }
      if (password != passwordRe) {
        Util.showSnackBar(context, "密码不一致～");
        return;
      }

      RegisterReq req = new RegisterReq(username, password, passwordRe);
      userRepository.register(req).then((UserModel model) {
        LogUtil.e("LoginResp: ${model.toString()}");
        Util.showSnackBar(context, "注册成功～");
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
              Gaps.vGap10,
              LoginItem(
                controller: _controllerPwd,
                prefixIcon: Icons.lock,
                hintText: IntlUtil.getString(context, Ids.user_pwd),
              ),
              Gaps.vGap10,
              LoginItem(
                controller: _controllerRePwd,
                prefixIcon: Icons.lock,
                hintText: IntlUtil.getString(context, Ids.user_re_pwd),
              ),
              new RoundButton(
                text: IntlUtil.getString(context, Ids.user_register),
                margin: EdgeInsets.only(top: 20),
                onPressed: () {
                  _userRegister();
                },
              ),
            ],
          ),
        )),
      ],
    );
  }
}
