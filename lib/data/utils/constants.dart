class Constants {

  static const LANGUAGE_CODE = 'az';
  static const COUNTRY_CODE = 'AZ';


  static List<LanguageModel> languages = [
    LanguageModel(
        languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(
        languageName: 'Azərbaycan dili', countryCode: 'AZ', languageCode: 'az'),
  ];

}

class LanguageModel {
  String? languageName;
  String? languageCode;
  String? countryCode;

  LanguageModel({this.languageName, this.countryCode, this.languageCode});
}