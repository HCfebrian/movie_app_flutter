import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/core/failure/exception_to_failure.dart';
import 'package:movie_app_flutter/core/failure/failure.dart';
import 'package:movie_app_flutter/data/data_source/remote/movie_remote_abst.dart';
import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:movie_app_flutter/domain/entity/movie_image.dart';
import 'package:movie_app_flutter/domain/repo/movie_repo_abst.dart';
import 'package:meta/meta.dart';

class MovieRepoImpl extends MovieRepoAbst{
  final MovieRemoteAbst movieRemote;

  MovieRepoImpl({@required this.movieRemote});

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async{
   try{
     final movies = await movieRemote.getPopularMovies();
     return Right(movies);
   }catch(e){
     return Left(ExceptionToFailure.handle(e));
   }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRated() async{
    try{
      final movies = await movieRemote.getTopRatedMovie();
      return Right(movies);
    }catch(e){
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies()async {
    try{
      final movies = await movieRemote.getUpComingMovies();
      return Right(movies);
    }catch(e){
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<MovieImageEntity>>> getMovieImage(String id) async{
    try{
      final images = await movieRemote.getMovieImage(id);
      return Right(images);
    }catch (e){
      return Left(ExceptionToFailure.handle(e));
    }
  }

}