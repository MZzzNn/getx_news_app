import '../../models/news_model.dart';

abstract class TechnologyRepository {
  Future<List<ArticleData>> getAllTechnologyPosts();
  Future<ArticleData> getTechnologyPostById(int id);
}
