part of 'get_image_bloc.dart';

abstract class GetImageEvent extends Equatable {
  const GetImageEvent();
  @override
  List<Object> get props => [];
}

class GetImage extends GetImageEvent{
  final String id;

  GetImage({@required this.id});
}