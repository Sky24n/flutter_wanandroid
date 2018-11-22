import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/blocs/bloc_index.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/pages/page_index.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogUtil.e("SettingPage build......");
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          IntlUtil.getString(context, StringIds.titleSetting),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          new ExpansionTile(
            title: new Row(
              children: <Widget>[
                Icon(
                  Icons.color_lens,
                  color: ColorT.gray_66,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    IntlUtil.getString(context, StringIds.titleTheme),
                  ),
                )
              ],
            ),
            children: <Widget>[
              new Wrap(
                children: themeColorMap.keys.map((String key) {
                  Color value = themeColorMap[key];
                  return new InkWell(
                    onTap: () {
                      SpUtil.putString(Constant.KEY_THEME_COLOR, key);
                      bloc.sendAppEvent(Constant.TYPE_SYS_UPDATE);
                    },
                    child: new Container(
                      margin: EdgeInsets.all(5.0),
                      width: 36.0,
                      height: 36.0,
                      color: value,
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          new ListTile(
            title: new Row(
              children: <Widget>[
                Icon(
                  Icons.language,
                  color: ColorT.gray_66,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    IntlUtil.getString(context, StringIds.titleLanguage),
                  ),
                )
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    SpHelper.getLanguageModel() == null
                        ? IntlUtil.getString(context, StringIds.languageAuto)
                        : IntlUtil.getString(
                            context, SpHelper.getLanguageModel().titleId,
                            languageCode: 'zh', countryCode: 'CH'),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: ColorT.gray_99,
                    )),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
            onTap: () {
              NavigatorUtil.push(context, (ctx) => LanguagePage(),
                  pageName: StringIds.titleLanguage);
            },
          )
        ],
      ),
    );
  }
}
