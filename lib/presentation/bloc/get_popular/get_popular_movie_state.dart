part of 'get_popular_movie_bloc.dart';

abstract class GetPopularMovieState extends Equatable {
  const GetPopularMovieState();
  @override
  List<Object> get props => [];
}

class GetPopularMovieInitial extends GetPopularMovieState {
  @override
  List<Object> get props => [];
}


class PopularMovieLoading extends GetPopularMovieState{}
class PopularMovieError extends GetPopularMovieState{
  final String msg;

  PopularMovieError(this.msg);
  @override
  List<Object> get props => [msg];
}
class PopularMovieLoaded extends GetPopularMovieState{
  final List<MovieEntity> listMovie;
  PopularMovieLoaded({@required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}
