
import 'package:toktik/domain/entities/video_post.dart';

/// esto nos ayudara a mapear como luce un local video post

class LocalVideoModel {
  
  // propiedades
  
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name, 
    required this.videoUrl, 
    this.likes = 0,
    this.views = 0
  });
  
  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) => LocalVideoModel(
    name: json['name'] ?? 'No name', 
    videoUrl: json['videoUrl'],
    likes: json['likes'] ?? 0,
    views: json['views'] ?? 0
  );
  
  VideoPost toVideoPostEntity() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views
  );
}