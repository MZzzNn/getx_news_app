import 'dart:developer';
import 'package:getx_news_app/repositories/science/science_repository.dart';
import 'package:getx_news_app/utils/network/remote/end_points.dart';
import '../../models/news_model.dart';
import '../../utils/network/remote/dio_helper.dart';


class ScienceAPI implements ScienceRepository {
  @override
  Future<List<ArticleData>> getAllSciencePosts() async {
    List<ArticleData> posts = [];
    try {
      var response = await DioHelper.getData(
          url: EndPoints.topHeadlines,
          query: {
            "country":EndPoints.country,
            "category":EndPoints.scienceCategory,
            'apikey':EndPoints.apiKey
          }
      );
      if (response.statusCode == 200) {
        var list = response.data['articles'] as List;
        print(' list  ${list}');
        posts = list.map((post) => ArticleData.fromJson(post)).toList();
        print(' posts  ${posts[0].title}');
      }
    } catch (exception) {
      log('getAllSciencePosts exception : $exception');
    }
    return posts;
  }

  @override
  Future<ArticleData> getSciencePostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
}
