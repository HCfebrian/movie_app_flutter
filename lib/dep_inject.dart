import 'package:get_it/get_it.dart';
import 'package:movie_app_flutter/data/data_source/remote/movie_remote_abst.dart';
import 'package:movie_app_flutter/data/data_source/remote/movie_remote_impl.dart';
import 'package:movie_app_flutter/data/data_source/remote/services/movie_api_service.dart';
import 'package:movie_app_flutter/data/repo/movie_repo_impl.dart';
import 'package:movie_app_flutter/domain/repo/movie_repo_abst.dart';
import 'package:movie_app_flutter/domain/usecase/movie_usecase.dart';
import 'package:movie_app_flutter/presentation/bloc/get_Image_screenshoot/get_image_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/get_popular/get_popular_movie_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/get_top_rated/get_top_rated_movie_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/get_upcoming/get_upcoming_movie_bloc.dart';

final sl = GetIt.instance;

void init(){

  //bloc
  sl.registerFactory<GetPopularMovieBloc>(() => GetPopularMovieBloc(usecase: sl()));
  sl.registerFactory<GetUpcomingMovieBloc>(() => GetUpcomingMovieBloc(usecase: sl()));
  sl.registerFactory<GetTopRatedMovieBloc>(() => GetTopRatedMovieBloc(usecase: sl()));
  sl.registerFactory<GetImageBloc>(() => GetImageBloc(usecase: sl()));

  //usecase
  sl.registerLazySingleton<MovieUsecase>(() => MovieUsecase(movieRepoAbst: sl()));

  //repo
  sl.registerLazySingleton<MovieRepoAbst>(() =>   MovieRepoImpl(movieRemote: sl()));

  //dataSource
  sl.registerLazySingleton<MovieRemoteAbst>(() => MovieRemoteImpl(movieService: sl()));


  sl.registerLazySingleton<MovieService>(() => MovieService.create());



}