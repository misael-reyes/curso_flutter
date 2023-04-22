import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
// esto es para acceder a la lista videoPosts
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  
  // TODO: Repository, DataSource
  
  bool initialLoading = true;
  List<VideoPost> videos = [];
  
  // función para cargar los videos
  Future<void> loadNextPage() async {
    
    // espera dos segundos para simular la carga de videos
    await Future.delayed(const Duration(seconds: 2));
    
    final List<VideoPost> newVideos = videoPosts.map( 
      (video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
    ).toList();
    
    videos.addAll(newVideos);
    
    initialLoading = false;
    
    notifyListeners();
  }
  
}