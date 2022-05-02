import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_news_app/repositories/business/business_api.dart';
import 'package:getx_news_app/repositories/sports/sports_api.dart';
import 'package:getx_news_app/views/business_view.dart';
import 'package:getx_news_app/views/science_view.dart';
import 'package:getx_news_app/views/sports_view.dart';
import 'package:getx_news_app/views/technology_view.dart';
import '../models/news_model.dart';
import '../repositories/science/science_api.dart';
import '../repositories/technology/science_api.dart';

class NewsController extends GetxController
    with BusinessAPI, SportsAPI, TechnologyAPI, ScienceAPI {
  @override
  void onInit() {
    getBusiness();
    getSports();
    getScience();
    getTechnology();
    super.onInit();
  }

  List<Widget> screens = const [
    BusinessView(),
    SportsView(),
    TechnologyView(),
    ScienceView()
  ];
  final List<String> titles = const [
    'Business',
    'Sports',
    'Technology',
    'Science'
  ];


  RxInt currentIndex = 0.obs;

  void changeScreen(int index) {
    currentIndex.value = index;
  }

  List<ArticleData> businessPosts = [];
  void getBusiness() async {
    businessPosts = await getAllBusinessPosts();
    update();
    log(' business: ${businessPosts[0].title}');
  }

  List<ArticleData> sportsPosts = [];
  void getSports() async {
    sportsPosts = await getAllSportsPosts();
    update();
    log(' sports: ${sportsPosts[0].title}');
  }

  List<ArticleData> sciencePosts = [];
  void getScience() async {
    sciencePosts = await getAllSciencePosts();
    update();
    log(' science: ${sciencePosts[0].title}');
  }

  List<ArticleData> technologyPosts = [];
  void getTechnology() async {
    technologyPosts = await getAllTechnologyPosts();
    update();
    log(' technology: ${technologyPosts[0].title}');
  }

  DateTime convertDate(String? dateApi) {
    if (dateApi != null) {
      var d = dateApi.split("T");
      List<int> date = d[0].split("-").map(int.parse).toList();
      List time = d[1].split(":");
      time.removeAt(2);
      time = time.map((e) => int.parse(e)).toList();
      var dateTime = DateTime(date[0], date[1], date[2], time[0], time[1]);
      return dateTime;
    }
    return DateTime.now();
  }

  String handleImage(String? image) {
    if (image == null) return "https://gate.ahram.org.eg/Media/Banners/Isticker.jpg";
    if (image.substring(image.length - 1) == ("g") ||
        image.substring(image.length - 1) == ("G")) return image;
    return "https://gate.ahram.org.eg/Media/Banners/Isticker.jpg";
  }

  bool isDark = GetStorage().read('isDarkMode') ?? false;
  void changeAppMode() async{
    isDark = !isDark;
    Get.changeThemeMode( isDark ? ThemeMode.dark : ThemeMode.light);
    await GetStorage().write('isDarkMode', isDark);
    update();
  }

  List<String> languages = ['English', 'Arabic'];
  Locale locale = const Locale('en');
  String currentLanguage = GetStorage().read('currentLanguage') ??'English';

  void changeLanguage(Object value) async{
    if (value == 1) {
      locale = const Locale('ar');
      currentLanguage = 'Arabic';
    } else {
      locale = const Locale('en');
      currentLanguage = 'English';
    }
    Get.back();
    Get.updateLocale(locale);
    await GetStorage().write('currentLanguage', currentLanguage);
    update();
  }
}
