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
      StringIds.titleSetting: 'Setting',
      StringIds.titleAbout: 'About',
      StringIds.titleShare: 'Share',
      StringIds.titleSignOut: 'Sign Out',
      StringIds.titleLanguage: 'Language',
      StringIds.languageAuto: 'Auto',
      StringIds.save: 'Save',
    }
  },
  'zh': {
    'CN': {
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
      StringIds.languageZH: '简体中文',
      StringIds.languageTW: '繁體中文（台灣）',
      StringIds.languageHK: '繁體中文（香港）',
      StringIds.languageEN: 'English',
      StringIds.save: '保存',
    },
    'HK': {
      StringIds.titleHome: '主頁',
      StringIds.titleRepos: '項目',
      StringIds.titleEvents: '動態',
      StringIds.titleSystem: '體系',
      StringIds.titleBookmarks: '書簽',
      StringIds.titleSetting: '設置',
      StringIds.titleAbout: '關於',
      StringIds.titleShare: '分享',
      StringIds.titleSignOut: '註銷',
      StringIds.titleLanguage: '語言',
      StringIds.languageAuto: '與系統同步',
      StringIds.save: '儲存',
    },
    'TW': {
      StringIds.titleHome: '主頁',
      StringIds.titleRepos: '項目',
      StringIds.titleEvents: '動態',
      StringIds.titleSystem: '體系',
      StringIds.titleBookmarks: '書簽',
      StringIds.titleSetting: '設置',
      StringIds.titleAbout: '關於',
      StringIds.titleShare: '分享',
      StringIds.titleSignOut: '註銷',
      StringIds.titleLanguage: '語言',
      StringIds.languageAuto: '與系統同步',
      StringIds.save: '儲存',
    }
  }
};

class StringIds {
  static String titleHome = 'title_home';
  static String titleRepos = 'title_repos';
  static String titleEvents = 'title_events';
  static String titleSystem = 'title_system';

  static String titleBookmarks = 'title_bookmarks';
  static String titleSetting = 'title_setting';
  static String titleAbout = 'title_about';
  static String titleShare = 'title_share';
  static String titleSignOut = 'title_signout';
  static String titleLanguage = 'title_language';

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
