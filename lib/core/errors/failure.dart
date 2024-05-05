import 'package:dio/dio.dart';

abstract class Failure{
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure{
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException e){
    switch(e.type){
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad Certificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromRequestError(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(message: 'Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromRequestError(int statusCode,dynamic response){
    if (statusCode == 400 || statusCode == 401 || statusCode == 403){
      return ServerFailure(message: response['fault']['faultstring']);
    }
    else if (statusCode == 404){
      return ServerFailure(message: 'Your request was not found, Please try later');
    }
    else if (statusCode == 500){
      return ServerFailure(message: 'There is a problem with server, Please try later');
    }
    else {
      return ServerFailure(message: 'There was an error, Please try again');
    }
  }
}