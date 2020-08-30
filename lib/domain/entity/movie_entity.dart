import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieEntity extends Equatable {
  final backdropPath,
      budget,
      id,
      overview,
      popularity,
      posterPath,
      releaseDate,
      originalLanguage,
      title,
      voteAverage,
      voteCount;

  final List<Genres> genres;

  MovieEntity(
      {@required this.backdropPath,
      @required this.budget,
      @required this.genres,
      @required this.id,
      @required this.overview,
      @required this.popularity,
      @required this.posterPath,
      @required this.releaseDate,
      @required this.originalLanguage,
      @required this.title,
      @required this.voteAverage,
      @required this.voteCount});

  @override
  List<Object> get props => [
        backdropPath,
        budget,
        genres,
        id,
        overview,
        popularity,
        posterPath,
        releaseDate,
        originalLanguage,
        title,
        voteAverage,
        voteCount
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  Genres({@required this.id,@required  this.name});

  @override
  List<Object> get props => [id, name];
}
