part of 'get_image_bloc.dart';


abstract class GetImageState extends Equatable {
  const GetImageState();
  @override
  List<Object> get props => [];
}

class GetImageInitial extends GetImageState {
  @override
  List<Object> get props => [];
}


class GetImageLoading extends GetImageState{}
class GetImageError extends GetImageState{
  final String msg;

  GetImageError(this.msg);
  @override
  List<Object> get props => [msg];
}
class GetImageLoaded extends GetImageState{
  final List<MovieImageEntity> listMovie;
  GetImageLoaded({@required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}

