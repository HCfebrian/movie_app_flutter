import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:movie_app_flutter/domain/entity/movie_image.dart';

abstract class MovieRemoteAbst {
  Future<List<MovieEntity>> getTopRatedMovie();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getUpComingMovies();
  Future<List<MovieImageEntity>> getMovieImage(String id);
}