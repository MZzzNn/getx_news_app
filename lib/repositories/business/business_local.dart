import 'package:getx_news_app/repositories/business/business_repository.dart';
import '../../models/news_model.dart';

class BusinessLocal extends BusinessRepository {
  @override
  Future<List<ArticleData>> getAllBusinessPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<ArticleData> getBusinessPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
}
