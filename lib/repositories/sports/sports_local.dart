import '../../models/news_model.dart';
import 'sports_repository.dart';

class SportsLocal extends SportsRepository {
  @override
  Future<List<ArticleData>> getAllSportsPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<ArticleData> getSportsPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
}
