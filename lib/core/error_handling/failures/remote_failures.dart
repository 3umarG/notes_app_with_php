abstract class Failure {
  final String message;
  Failure(this.message);
}

class NoInternetFailure extends Failure {
  NoInternetFailure(super.message);
}

class DataParsingFailure extends Failure {
  DataParsingFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class ClientFailure extends Failure {
  ClientFailure(super.message);
}

class ResponseFailure extends Failure {
  ResponseFailure(super.message);
}

class TimeOutFailure extends Failure {
  TimeOutFailure(super.message);

}