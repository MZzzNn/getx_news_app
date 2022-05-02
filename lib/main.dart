import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_news_app/routes_manager.dart';
import 'package:getx_news_app/translations.dart';
import 'package:getx_news_app/utils/binding.dart';
import 'package:getx_news_app/utils/network/remote/dio_helper.dart';
import 'package:getx_news_app/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await GetStorage.init();

  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  bool? isDarkMode = GetStorage().read('isDarkMode');
  String? currentLanguage = GetStorage().read('currentLanguage');

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.darkTheme,
      theme: Themes.lightTheme,
      themeMode: isDarkMode??false ? ThemeMode.dark : ThemeMode.light,
      translations: Translation(),
      locale: currentLanguage == 'Arabic' ?  const Locale('ar') : const Locale('en'),
      fallbackLocale: const Locale('en'),
      initialBinding: MyBinding(),
      initialRoute: Routes.splashRoute,
      getPages: RouteGenerator.getRoute,
      //  home: NewsLayout(),
    );
  }
}

//       themeMode:cubit.isDark? ThemeMode.dark : ThemeMode.light,
