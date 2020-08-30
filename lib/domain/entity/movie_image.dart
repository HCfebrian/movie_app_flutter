import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieImageEntity extends Equatable {
  final double aspectRatio;
  final String filePath;
  final int height;
  final String iso6391;
  final double voteAverage;
  final int voteCount;
  final int width;

  MovieImageEntity(
      {@required this.aspectRatio,
      @required this.filePath,
      @required this.height,
      @required this.iso6391,
      @required this.voteAverage,
      @required this.voteCount,
      @required this.width});

  @override
  List<Object> get props =>
      [aspectRatio, filePath, height, iso6391, voteAverage, voteCount, width];
}
