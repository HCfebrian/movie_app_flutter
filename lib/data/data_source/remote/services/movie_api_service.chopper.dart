// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$MovieService extends MovieService {
  _$MovieService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = MovieService;

  Future<Response> getTopRatedMovie() {
    final $url = '/3/movie/top_rated?api_key=4317b8fa5af5220fa0aa1b42e4d755ca';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getPopularMovie() {
    final $url = '/3/movie/popular?api_key=4317b8fa5af5220fa0aa1b42e4d755ca';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getMovieImage(String movieID) {
    final $url =
        '/3/movie/${movieID}/images?api_key=4317b8fa5af5220fa0aa1b42e4d755ca';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getUpComingMovie() {
    final $url = '/3/movie/upcoming?api_key=4317b8fa5af5220fa0aa1b42e4d755ca';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
