import '../../models/news_model.dart';

abstract class BusinessRepository {
  Future<List<ArticleData>> getAllBusinessPosts();
  Future<ArticleData> getBusinessPostById(int id);
}
