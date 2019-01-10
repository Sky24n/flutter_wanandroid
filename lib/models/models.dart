import 'package:flutter/widgets.dart';

class LanguageModel {
  String titleId;
  String languageCode;
  String countryCode;
  bool isSelected;

  LanguageModel(this.titleId, this.languageCode, this.countryCode,
      {this.isSelected: false});

  LanguageModel.fromJson(Map<String, dynamic> json)
      : titleId = json['titleId'],
        languageCode = json['languageCode'],
        countryCode = json['countryCode'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() => {
        'titleId': titleId,
        'languageCode': languageCode,
        'countryCode': countryCode,
        'isSelected': isSelected,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"titleId\":\"$titleId\"");
    sb.write(",\"languageCode\":\"$languageCode\"");
    sb.write(",\"countryCode\":\"$countryCode\"");
    sb.write('}');
    return sb.toString();
  }
}

class SplashModel {
  String title;
  String content;
  String url;
  String imgUrl;

  SplashModel({this.title, this.content, this.url, this.imgUrl});

  SplashModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        url = json['url'],
        imgUrl = json['imgUrl'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'url': url,
        'imgUrl': imgUrl,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"content\":\"$content\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imgUrl\":\"$imgUrl\"");
    sb.write('}');
    return sb.toString();
  }
}

class VersionModel {
  String title;
  String content;
  String url;
  String version;

  VersionModel({this.title, this.content, this.url, this.version});

  VersionModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        url = json['url'],
        version = json['version'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'url': url,
        'version': version,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"content\":\"$content\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"version\":\"$version\"");
    sb.write('}');
    return sb.toString();
  }
}

class ComModel {
  String version;
  String title;
  String content;
  String extra;
  String url;
  String imgUrl;
  String author;
  String updatedAt;

  int typeId;
  String titleId;

  Widget page;

  ComModel(
      {this.version,
      this.title,
      this.content,
      this.extra,
      this.url,
      this.imgUrl,
      this.author,
      this.updatedAt,
      this.typeId,
      this.titleId,
      this.page});

  ComModel.fromJson(Map<String, dynamic> json)
      : version = json['version'],
        title = json['title'],
        content = json['content'],
        extra = json['extra'],
        url = json['url'],
        imgUrl = json['imgUrl'],
        author = json['author'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        'version': version,
        'title': title,
        'content': content,
        'extra': extra,
        'url': url,
        'imgUrl': imgUrl,
        'author': author,
        'updatedAt': updatedAt,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"version\":\"$version\"");
    sb.write(",\"title\":\"$title\"");
    sb.write(",\"content\":\"$content\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imgUrl\":\"$imgUrl\"");
    sb.write(",\"author\":\"$author\"");
    sb.write(",\"updatedAt\":\"$updatedAt\"");
    sb.write('}');
    return sb.toString();
  }
}
