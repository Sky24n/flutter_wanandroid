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
    return "{" +
        "\"titleId\":\"" +
        titleId +
        "\"" +
        ", \"languageCode\":\"" +
        languageCode +
        "\"" +
        ", \"countryCode\":\"" +
        countryCode +
        "\"" +
        '}';
  }
}