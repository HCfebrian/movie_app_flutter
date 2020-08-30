import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
abstract class Failure extends Equatable{
  final int code;
  final String msg;

  Failure({@required this.code, @required this.msg});

  @override
  List<Object> get props => [code, msg];

}

class FailedToGetDataFailure extends Failure {
  FailedToGetDataFailure({@required int code, @required String message})
      : super(code:code, msg: message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(int code) : super(code: code, msg: "Not Found");
}

class InvalidAPIFailure extends Failure {
  InvalidAPIFailure(int code)
      : super(code: code, msg: "Invalid API");
}

class NetworkFailure extends Failure{
  NetworkFailure() : super(code: 0, msg: "No Internet Connection");

}