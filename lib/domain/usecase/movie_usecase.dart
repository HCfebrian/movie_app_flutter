import 'package:movie_app_flutter/core/failure/failure.dart';
import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:movie_app_flutter/domain/entity/movie_image.dart';
import 'package:movie_app_flutter/domain/repo/movie_repo_abst.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

class MovieUsecase {
  final MovieRepoAbst movieRepoAbst;

  MovieUsecase({@required this.movieRepoAbst});
  Future<Either<Failure, List<MovieEntity>>> getTopRated() async{
    return await movieRepoAbst.getTopRated();
  }

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async{
    return await movieRepoAbst.getPopularMovies();
  }

  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies() async{
    return await movieRepoAbst.getUpcomingMovies();
  }
  Future<Either<Failure, List<MovieImageEntity>>> getMovieImage(String id) async{
    return await movieRepoAbst.getMovieImage(id);
  }
}