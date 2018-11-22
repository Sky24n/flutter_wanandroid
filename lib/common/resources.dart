import 'package:flutter/material.dart';

Map<String, Map<String, String>> localizedSimpleValues = {
  'en': {
    StringIds.titleHome: 'Home',
    StringIds.titleRepos: 'Repos',
    StringIds.titleEvents: 'Events',
    StringIds.titleSystem: 'System',
    StringIds.titleBookmarks: 'Bookmarks',
    StringIds.titleSetting: 'Setting',
    StringIds.titleAbout: 'About',
    StringIds.titleShare: 'Share',
    StringIds.titleSignOut: 'Sign Out',
    StringIds.titleLanguage: 'Language',
    StringIds.languageAuto: 'Auto',
  },
  'zh': {
    StringIds.titleHome: '主页',
    StringIds.titleRepos: '项目',
    StringIds.titleEvents: '动态',
    StringIds.titleSystem: '体系',
    StringIds.titleBookmarks: '书签',
    StringIds.titleSetting: '设置',
    StringIds.titleAbout: '关于',
    StringIds.titleShare: '分享',
    StringIds.titleSignOut: '注销',
    StringIds.titleLanguage: '多语言',
    StringIds.languageAuto: '跟随系统',
  },
};

Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      StringIds.titleHome: 'Home',
      StringIds.titleRepos: 'Repos',
      StringIds.titleEvents: 'Events',
      StringIds.titleSystem: 'System',
      StringIds.titleBookmarks: 'Bookmarks',
      StringIds.titleCollection: 'Collection',
      StringIds.titleSetting: 'Setting',
      StringIds.titleAbout: 'About',
      StringIds.titleShare: 'Share',
      StringIds.titleSignOut: 'Sign Out',
      StringIds.titleLanguage: 'Language',
      StringIds.languageAuto: 'Auto',
      StringIds.save: 'Save',
      StringIds.titleTheme: 'Theme',
    }
  },
  'zh': {
    'CN': {
      StringIds.titleHome: '主页',
      StringIds.titleRepos: '项目',
      StringIds.titleEvents: '动态',
      StringIds.titleSystem: '体系',
      StringIds.titleBookmarks: '书签',
      StringIds.titleCollection: '收藏',
      StringIds.titleSetting: '设置',
      StringIds.titleAbout: '关于',
      StringIds.titleShare: '分享',
      StringIds.titleSignOut: '注销',
      StringIds.titleLanguage: '多语言',
      StringIds.languageAuto: '跟随系统',
      StringIds.languageZH: '简体中文',
      StringIds.languageTW: '繁體中文（台灣）',
      StringIds.languageHK: '繁體中文（香港）',
      StringIds.languageEN: 'English',
      StringIds.save: '保存',
      StringIds.titleTheme: '主题',
    },
    'HK': {
      StringIds.titleHome: '主頁',
      StringIds.titleRepos: '項目',
      StringIds.titleEvents: '動態',
      StringIds.titleSystem: '體系',
      StringIds.titleBookmarks: '書簽',
      StringIds.titleCollection: '收藏',
      StringIds.titleSetting: '設置',
      StringIds.titleAbout: '關於',
      StringIds.titleShare: '分享',
      StringIds.titleSignOut: '註銷',
      StringIds.titleLanguage: '語言',
      StringIds.languageAuto: '與系統同步',
      StringIds.save: '儲存',
      StringIds.titleTheme: '主題',
    },
    'TW': {
      StringIds.titleHome: '主頁',
      StringIds.titleRepos: '項目',
      StringIds.titleEvents: '動態',
      StringIds.titleSystem: '體系',
      StringIds.titleBookmarks: '書簽',
      StringIds.titleCollection: '收藏',
      StringIds.titleSetting: '設置',
      StringIds.titleAbout: '關於',
      StringIds.titleShare: '分享',
      StringIds.titleSignOut: '註銷',
      StringIds.titleLanguage: '語言',
      StringIds.languageAuto: '與系統同步',
      StringIds.save: '儲存',
      StringIds.titleTheme: '主題',
    }
  }
};

class StringIds {
  static String titleHome = 'title_home';
  static String titleRepos = 'title_repos';
  static String titleEvents = 'title_events';
  static String titleSystem = 'title_system';

  static String titleBookmarks = 'title_bookmarks';
  static String titleCollection = 'title_collection';
  static String titleSetting = 'title_setting';
  static String titleAbout = 'title_about';
  static String titleShare = 'title_share';
  static String titleSignOut = 'title_signout';
  static String titleLanguage = 'title_language';
  static String titleTheme = 'title_theme';
  static String titleAuthor = 'title_author';

  static String languageAuto = 'language_auto';
  static String languageZH = 'language_zh';
  static String languageTW = 'language_tw';
  static String languageHK = 'language_hk';
  static String languageEN = 'language_en';

  static String save = 'save';
}

class IconRes {
  IconData search = Icons.search;
  IconData bookmark = Icons.bookmark;
  IconData settings = Icons.settings;
  IconData share = Icons.share;
  IconData info = Icons.info;
  IconData powerSettingsNew = Icons.power_settings_new;
  IconData trendingUp = Icons.trending_up;
  IconData colorLens = Icons.color_lens;
}

class ColorT {
  static const Color gray_33 = Color(0xFF333333); //51
  static const Color gray_66 = Color(0xFF666666); //102
  static const Color gray_99 = Color(0xFF999999); //153
  static const Color common_orange = Color(0XFFFC9153); //252 145 83
  static const Color gray_ef = Color(0XFFEFEFEF); //153

  static const Color gray_f0 = Color(0xfff0f0f0); //<!--204-->
  static const Color gray_f5 = Color(0xfff5f5f5); //<!--204-->
  static const Color gray_cc = Color(0xffcccccc); //<!--204-->
  static const Color gray_ce = Color(0xffcecece); //<!--206-->
  static const Color green_1 = Color(0xff009688); //<!--204-->
  static const Color green_62 = Color(0xff626262); //<!--204-->
  static const Color green_e5 = Color(0xffe5e5e5); //<!--204-->
  static const Color divider = Color(0xffe5e5e5);
  static const Color transparent_80 = Color(0x80000000); //<!--204-->
}

Map<String, Color> themeColorMap = {
  'gray': ColorT.gray_33,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.deepPurple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.deepOrange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};

class Decorations {
  static Decoration bottom = BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.33, color: ColorT.divider)));
}
