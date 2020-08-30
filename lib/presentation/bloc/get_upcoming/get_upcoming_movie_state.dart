part of 'get_upcoming_movie_bloc.dart';

abstract class GetUpcomingMovieState extends Equatable {
  const GetUpcomingMovieState();
  @override
  List<Object> get props => [];
}

class GetUpcomingMovieInitial extends GetUpcomingMovieState {
  @override
  List<Object> get props => [];
}


class UpcomingMovieLoading extends GetUpcomingMovieState{}
class UpcomingMovieError extends GetUpcomingMovieState{
  final String msg;

  UpcomingMovieError(this.msg);
  @override
  List<Object> get props => [msg];
}
class UpcomingMovieLoaded extends GetUpcomingMovieState{
  final List<MovieEntity> listMovie;
  UpcomingMovieLoaded({@required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}

