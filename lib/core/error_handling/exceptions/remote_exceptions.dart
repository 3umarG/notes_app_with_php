abstract class RemoteException implements Exception {
  final String message ;
  final int statusCode;

  RemoteException(this.message, this.statusCode);
}

/// error in http.get() for example , because of no internet to send the request .
class NoInternetException extends RemoteException {
  NoInternetException(super.message, super.statusCode);
}

/// This for the entire logic app : the model you design is not compatible with the received data from API
class DataParsingException extends RemoteException {
  DataParsingException(super.message, super.statusCode);
}

/// 5XX Status Code : error in Server , the Server failed or stopped .
class ServerException extends RemoteException {
  ServerException(super.message, super.statusCode);
}

/// 4XX Status Code : Client Error , API request failed because of the wrong parameters or sent data .
class ClientException extends RemoteException {
  ClientException(super.message, super.statusCode);
}


/// When the status code 2XX , but there is an error message or hint you should do .
class ResponseException extends RemoteException {
  ResponseException(super.message, super.statusCode);
}

class TimeOutCustomException extends RemoteException {
  TimeOutCustomException(super.message, super.statusCode);

}

