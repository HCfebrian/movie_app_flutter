part of 'get_upcoming_movie_bloc.dart';

abstract class GetUpcomingMovieEvent extends Equatable {
  const GetUpcomingMovieEvent();
  @override
  List<Object> get props => [];
}

class GetUpcomingMovie extends GetUpcomingMovieEvent{}