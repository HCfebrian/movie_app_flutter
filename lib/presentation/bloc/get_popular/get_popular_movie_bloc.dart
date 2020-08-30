import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:movie_app_flutter/domain/usecase/movie_usecase.dart';
import 'package:meta/meta.dart';

part 'get_popular_movie_event.dart';

part 'get_popular_movie_state.dart';

class GetPopularMovieBloc
    extends Bloc<GetPopularMovieEvent, GetPopularMovieState> {
  final MovieUsecase usecase;

  GetPopularMovieBloc({@required this.usecase})
      : super(GetPopularMovieInitial());

  @override
  Stream<GetPopularMovieState> mapEventToState(
    GetPopularMovieEvent event,
  ) async* {
    if (event is GetPopularMovie) {
      yield PopularMovieLoading();
      final failureOrData = await usecase.getPopularMovies();
      yield failureOrData.fold((failure) => PopularMovieError(failure.msg),
          (data) => PopularMovieLoaded(listMovie: data));
    }
  }
}
