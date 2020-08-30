import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:meta/meta.dart';


class Response {
  int page;
  List<MovieModel> results;
  int totalPages;
  int totalResults;

  Response({this.page,
    this.results,
    this.totalPages,
    this.totalResults});

  Response.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = new List<MovieModel>();
      json['results'].forEach((v) {
        results.add(new MovieModel.from(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class MovieModel extends MovieEntity {
  MovieModel(
      {@required final backdropPath,
      @required final budget,
      @required final id,
      @required final overview,
      @required final popularity,
      @required final posterPath,
      @required final releaseDate,
      @required final originalLanguage,
      @required final title,
      @required final voteAverage,
      @required final voteCount,
      @required final List<Genres> genres})
      : super(
            backdropPath: backdropPath,
            budget: budget,
            id: id,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            originalLanguage: originalLanguage,
            title: title,
            voteAverage: voteAverage,
            voteCount: voteCount,
            genres: genres);

  factory MovieModel.from(Map<String, dynamic> json) {
    List<Genres> genres;
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new GenreModel.fromJson(v));
      });
    }else{
      print("genre null");
    }

    return MovieModel(
        backdropPath: json['backdrop_path'],
        budget: json['budget'],
        id: json['id'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        originalLanguage: json['original_language'],
        title: json['title'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        genres: genres);
  }
}

class GenreModel extends Genres {
  GenreModel({
    @required final id,
    @required final name,
  }) : super(id: id, name: name);

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    print(json["name"]);
    return GenreModel(id: json["id"], name: json["name"]);
  }
}
