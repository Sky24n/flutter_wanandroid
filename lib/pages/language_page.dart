import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/blocs/notice_test.dart';
import 'package:flutter_wanandroid/common/component_index.dart';
import 'package:flutter_wanandroid/common/resources.dart';
import 'package:flutter_wanandroid/models/models.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LanguagePageState();
  }
}

class _LanguagePageState extends State<LanguagePage>
    with LBaseState<LanguagePage> {
  List<LanguageModel> _list = new List();

  LanguageModel _currentLanguage;

  @override
  void initState() {
    super.initState();

    _list.add(LanguageModel(StringIds.languageAuto, '', ''));
    _list.add(LanguageModel(StringIds.languageZH, 'zh', 'CH'));
    _list.add(LanguageModel(StringIds.languageTW, 'zh', 'TW'));
    _list.add(LanguageModel(StringIds.languageHK, 'zh', 'HK'));
    _list.add(LanguageModel(StringIds.languageEN, 'en', 'US'));

    _currentLanguage = SpHelper.getLanguageModel();
    if (ObjectUtil.isEmpty(_currentLanguage)) {
      _currentLanguage = _list[0];
    }

    _updateData();
  }

  void _updateData() {
    LogUtil.e('currentLanguage: ' + _currentLanguage.toString());
    String language = _currentLanguage.countryCode;
    for (int i = 0, length = _list.length; i < length; i++) {
      _list[i].isSelected = (_list[i].countryCode == language);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          cl.getString(StringIds.titleLanguage),
          style: new TextStyle(fontSize: 16.0),
        ),
        actions: [
          new Padding(
            padding: EdgeInsets.all(12.0),
            child: new SizedBox(
              width: 64.0,
              child: new RaisedButton(
                textColor: Colors.white,
                color: Colors.indigoAccent,
                child: Text(
                  cl.getString(StringIds.save),
                  style: new TextStyle(fontSize: 12.0),
                ),
                onPressed: () {
                  SpUtil.putString(
                      Constant.keyLanguage,
                      ObjectUtil.isEmpty(_currentLanguage.languageCode)
                          ? ''
                          : json.encode(_currentLanguage));
                  NoticeTest.getInstance().ctrl.add(null);
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: new ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            LanguageModel model = _list[index];
            return new ListTile(
              title: new Text(
                (model.titleId == StringIds.languageAuto
                    ? cl.getString(model.titleId)
                    : cl.getString(model.titleId,
                        languageCode: 'zh', countryCode: 'CH')),
                style: new TextStyle(fontSize: 13.0),
              ),
              trailing: new Radio(
                  value: true,
                  groupValue: model.isSelected == true,
                  activeColor: Colors.indigoAccent,
                  onChanged: (value) {
                    setState(() {
                      _currentLanguage = model;
                      _updateData();
                    });
                  }),
              onTap: () {
                setState(() {
                  _currentLanguage = model;
                  _updateData();
                });
              },
            );
          }),
    );
  }
}
