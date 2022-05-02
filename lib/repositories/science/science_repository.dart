import '../../models/news_model.dart';

abstract class ScienceRepository {
  Future<List<ArticleData>> getAllSciencePosts();
  Future<ArticleData> getSciencePostById(int id);
}
