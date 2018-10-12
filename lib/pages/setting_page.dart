import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/pages/page_index.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends LBaseState<SettingPage> {
  @override
  Widget build(BuildContext context) {
    LanguageModel languageModel = SpHelper.getLanguageModel();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cl.getString(StringIds.titleSetting),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.language,
                  size: 18.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    cl.getString(StringIds.titleLanguage),
                    style: TextStyle(fontSize: 13.0),
                  ),
                )
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    languageModel == null
                        ? cl.getString(StringIds.languageAuto)
                        : cl.getString(languageModel.titleId,
                            languageCode: 'zh', countryCode: 'CH'),
                    style: TextStyle(fontSize: 12.0)),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
            onTap: () {
              NavigatorUtil.push(context, (ctx) => LanguagePage(),
                  whenComplete: (_) {
                ///延迟200ms更新CustomLocalizations.
                Future.delayed(Duration(milliseconds: 200), () {
                  setState(() {
                    cl = CustomLocalizations.instance;
                  });
                });
              });
            },
          )
        ],
      ),
    );
  }
}
