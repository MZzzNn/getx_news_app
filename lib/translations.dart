
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:getx_news_app/utils/langs/en.dart';
import 'package:getx_news_app/utils/langs/ar.dart';

class Translation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':en,
    'ar':ar,
  };


}