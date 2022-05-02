import 'package:dio/dio.dart';


// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// country : eg
// category : business
// apiKey : e93441c24e6c4b539e5f03eafed5e841
// queries : country=eg&category=business&apikey=e93441c24e6c4b539e5f03eafed5e841

class EndPoints{

  EndPoints._();
  // /https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=e93441c24e6c4b539e5f03eafed5e841

  static const String apiKey = 'e93441c24e6c4b539e5f03eafed5e841';
  static const  String baseUrl = 'https://newsapi.org/';
  static const String topHeadlines = 'v2/top-headlines';
  static const  String country = 'eg';
  static const  String businessCategory = 'business';
  static const  String sportsCategory = 'sports';
  static const  String technologyCategory = 'technology';
  static const  String scienceCategory = 'science';

  static String chosenCategory(EndPointsCategory category){
    switch(category){
      case EndPointsCategory.business:
        return EndPoints.businessCategory;
      case EndPointsCategory.sports:
        return EndPoints.sportsCategory;
      case EndPointsCategory.technology:
        return EndPoints.technologyCategory;
      case EndPointsCategory.science:
        return EndPoints.scienceCategory;
    }
  }

}

enum EndPointsCategory{
  business,
  sports,
  technology,
  science
}
