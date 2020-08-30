
import 'failure.dart';

class ExceptionToFailure {
  static handle(e){
    switch(e.statusCode){
      case 404:
        return NotFoundFailure(e.statusCode);
      case 401:
        return InvalidAPIFailure(e.statusCode);
      default:
        return FailedToGetDataFailure(code: e.statusCode, message: e.message);
    }
  }
}