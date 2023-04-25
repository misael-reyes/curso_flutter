
import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostsRepository implements VideoPostRepository{
  
  /// lo hacemos asi para que cualquier tipo de data source sea permitido, locales
  /// web, en producccion, etc
  final VideoPostDatasource videosDatasource;

  VideoPostsRepository({required this.videosDatasource});
  
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}