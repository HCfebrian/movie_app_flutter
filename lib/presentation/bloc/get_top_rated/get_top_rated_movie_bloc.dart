import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/domain/usecase/movie_usecase.dart';

part 'get_top_rated_movie_event.dart';

part 'get_top_rated_movie_state.dart';

class GetTopRatedMovieBloc
    extends Bloc<GetTopRatedMovieEvent, GetTopRatedMovieState> {
  final MovieUsecase usecase;

  GetTopRatedMovieBloc({@required this.usecase})
      : super(GetTopRatedMovieInitial());

  @override
  Stream<GetTopRatedMovieState> mapEventToState(
    GetTopRatedMovieEvent event,
  ) async* {
    if (event is GetTopRatedMovie) {
      yield TopRatedMovieLoading();
      final failureOrData = await usecase.getTopRated();
      yield failureOrData.fold((failure) => TopRatedMovieError(failure.msg),
          (data) => TopRatedMovieLoaded(listMovie: data));
    }
  }
}
