import 'package:movie_app_flutter/core/failure/failure.dart';
import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/domain/entity/movie_image.dart';

abstract class MovieRepoAbst{
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRated();
  Future<Either<Failure, List<MovieImageEntity>>> getMovieImage(String id);

}