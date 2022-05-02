import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_news_app/views/business_view.dart';
import 'package:getx_news_app/views/news_layout.dart';
import 'package:getx_news_app/views/science_view.dart';
import 'package:getx_news_app/views/splash_view.dart';
import 'package:getx_news_app/views/sports_view.dart';
import 'package:getx_news_app/views/technology_view.dart';
import 'package:getx_news_app/views/web_view_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String newsLayoutRoute = "/newsLayout";
  static const String businessRoute = "/business";
  static const String scienceRoute = "/science";
  static const String sportsRoute = "/sports";
  static const String technologyRoute = "/technology";
  static const String webViewRoute = "/webView";
}

class RouteGenerator {
  static List<GetPage>? getRoute = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.newsLayoutRoute,
      page: () => NewsLayout(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.businessRoute,
      page: () => BusinessView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.scienceRoute,
      page: () => ScienceView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.sportsRoute,
      page: () => SportsView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.technologyRoute,
      page: () => TechnologyView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.webViewRoute,
      page: () => const WebViewScreen(),
      transition: Transition.fade,
    ),
  ];
}
