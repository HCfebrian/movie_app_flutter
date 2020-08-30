import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:movie_app_flutter/domain/usecase/movie_usecase.dart';

part 'get_upcoming_movie_event.dart';
part 'get_upcoming_movie_state.dart';

class GetUpcomingMovieBloc
    extends Bloc<GetUpcomingMovieEvent, GetUpcomingMovieState> {
  final MovieUsecase usecase;

  GetUpcomingMovieBloc({@required this.usecase})
      : super(GetUpcomingMovieInitial());

  @override
  Stream<GetUpcomingMovieState> mapEventToState(
    GetUpcomingMovieEvent event,
  ) async* {
    if (event is GetUpcomingMovie) {
      yield UpcomingMovieLoading();
      final failureOrData = await usecase.getUpcomingMovies();
      yield failureOrData.fold((failure) => UpcomingMovieError(failure.msg),
          (data) => UpcomingMovieLoaded(listMovie: data));
    }
  }
}
