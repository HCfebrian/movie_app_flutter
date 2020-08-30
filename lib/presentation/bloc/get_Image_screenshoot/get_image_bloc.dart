import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/domain/entity/movie_image.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/domain/usecase/movie_usecase.dart';

part 'get_image_event.dart';

part 'get_image_state.dart';

class GetImageBloc extends Bloc<GetImageEvent, GetImageState> {
  final MovieUsecase usecase;

  GetImageBloc({@required this.usecase}) : super(GetImageInitial());

  @override
  Stream<GetImageState> mapEventToState(GetImageEvent event,) async* {
    if (event is GetImage) {
      yield GetImageLoading();
      final failureOrData = await usecase.getMovieImage(event.id);

      yield failureOrData.fold((failure) => GetImageError(failure.msg), (
          data) => GetImageLoaded(listMovie: data));
    }
  }
}
