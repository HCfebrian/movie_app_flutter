import 'package:movie_app_flutter/domain/entity/movie_image.dart';
import 'package:meta/meta.dart';

class MovieImageResponse {
  int id;
  List<Backdrops> backdrops;

  MovieImageResponse({this.id, this.backdrops});

  MovieImageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['backdrops'] != null) {
      backdrops = new List<Backdrops>();
      json['backdrops'].forEach((v) {
        backdrops.add(new Backdrops.fromJson(v));
      });
    }
  }
}

class Backdrops extends MovieImageEntity {
  final double aspectRatio;
  final String filePath;
  final int height;
  final String iso6391;
  final double voteAverage;
  final int voteCount;
  final int width;

  Backdrops(
      {@required this.aspectRatio,
      @required this.filePath,
      @required this.height,
      @required this.iso6391,
      @required this.voteAverage,
      @required this.voteCount,
      @required this.width})
      : super(
            aspectRatio: aspectRatio,
            filePath: filePath,
            height: height,
            iso6391: iso6391,
            voteAverage: voteAverage,
            voteCount: voteCount,
            width: width);

  factory Backdrops.fromJson(Map<String, dynamic> json) {
    return Backdrops(
        aspectRatio: json['aspect_ratio'],
        filePath: json['file_path'],
        height: json['height'],
        iso6391: json['iso_639_1'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        width: json['width']);
  }
}
