import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostsRepository {
  
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID);

  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
