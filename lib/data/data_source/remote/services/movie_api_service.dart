import 'package:chopper/chopper.dart';
import 'package:movie_app_flutter/core/value/static_value.dart';

part 'movie_api_service.chopper.dart';

@ChopperApi(baseUrl: "/3/movie/")
abstract class MovieService extends ChopperService {
  @Get(
    path: 'top_rated?api_key=${StaticValue.API_KEY}',
  )
  Future<Response> getTopRatedMovie();

  @Get(path: 'popular?api_key=${StaticValue.API_KEY}')
  Future<Response> getPopularMovie();

  @Get(
    path: '{movie_id}/images?api_key=${StaticValue.API_KEY}',
  )
  Future<Response> getMovieImage(@Path('movie_id') String movieID);


  @Get(path: 'upcoming?api_key=${StaticValue.API_KEY}')
  Future<Response> getUpComingMovie();

  static MovieService create() {
    final client = ChopperClient(
        baseUrl: "https://api.themoviedb.org",
        services: [_$MovieService()],
        converter: JsonConverter());
    return _$MovieService(client);
  }
}
