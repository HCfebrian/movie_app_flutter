part of 'get_top_rated_movie_bloc.dart';

abstract class GetTopRatedMovieState extends Equatable {
  const GetTopRatedMovieState();
  @override
  List<Object> get props => [];
}

class GetTopRatedMovieInitial extends GetTopRatedMovieState {
  @override
  List<Object> get props => [];
}


class TopRatedMovieLoading extends GetTopRatedMovieState{}
class TopRatedMovieError extends GetTopRatedMovieState{
  final String msg;

  TopRatedMovieError(this.msg);
  @override
  List<Object> get props => [msg];
}
class TopRatedMovieLoaded extends GetTopRatedMovieState{
  final List<MovieEntity> listMovie;
  TopRatedMovieLoaded({@required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}

