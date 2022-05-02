import '../../models/news_model.dart';

abstract class SportsRepository {
  Future<List<ArticleData>> getAllSportsPosts();
  Future<ArticleData> getSportsPostById(int id);
}
