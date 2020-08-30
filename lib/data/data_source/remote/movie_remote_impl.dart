import 'dart:convert';

import 'package:movie_app_flutter/core/failure/exception.dart';
import 'package:movie_app_flutter/data/data_source/remote/movie_remote_abst.dart';
import 'package:movie_app_flutter/data/data_source/remote/services/movie_api_service.dart';
import 'package:movie_app_flutter/data/model/movie_image_model.dart';
import 'package:movie_app_flutter/data/model/movie_model.dart';
import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/domain/entity/movie_image.dart';


class MovieRemoteImpl implements MovieRemoteAbst{
  final MovieService movieService;

  MovieRemoteImpl({@required this.movieService});
  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    final movie = await movieService.getPopularMovie();

    if (movie.statusCode != 200) {
      throw GetDataException(movie.statusCode, "Unable to get data ");
    }

    if (movie.isSuccessful) {
      final jsonResult = json.decode(movie.bodyString);
      final response = Response.fromJson(jsonResult);
      return response.results;
    }
   }

  @override
  Future<List<MovieEntity>> getTopRatedMovie() async{
    final movie = await movieService.getTopRatedMovie();

    if (movie.statusCode != 200) {
      throw GetDataException(movie.statusCode, "Unable to get data ");
    }

    if (movie.isSuccessful) {
      final jsonResult = json.decode(movie.bodyString);
      final response = Response.fromJson(jsonResult);
      return response.results;
    }
  }

  @override
  Future<List<MovieEntity>> getUpComingMovies() async{
    final movie = await movieService.getUpComingMovie();

    if (movie.statusCode != 200) {
      throw GetDataException(movie.statusCode, "Unable to get data ");
    }

    if (movie.isSuccessful) {
      final jsonResult = json.decode(movie.bodyString);
      final response = Response.fromJson(jsonResult);
      return response.results;
    }
  }

  @override
  Future<List<MovieImageEntity>> getMovieImage(String id) async{
    final image= await movieService.getMovieImage(id);

    if (image.statusCode != 200) {
      throw GetDataException(image.statusCode, "Unable to get data ");
    }

    if (image.isSuccessful) {
      final jsonResult = json.decode(image.bodyString);
      final response = MovieImageResponse.fromJson(jsonResult);
      return response.backdrops;
    }

  }

}