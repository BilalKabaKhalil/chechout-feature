import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class Failure implements Exception {
  final String message;

  Failure(this.message);
}

class PaymentFailure extends Failure {
  PaymentFailure(super.message);
}

class StripeFailure extends Failure {
  StripeFailure(super.message);

  factory StripeFailure.fromResponse(StripeException e) {
    switch (e.error.code) {
      case FailureCode.Canceled:
        return CanceledFailure();
      case FailureCode.Failed:
        return StripeFailure(e.error.message ?? 'There Was An Error');
      case FailureCode.Timeout:
        return StripeFailure('Timeout With Stripe Request');
      case FailureCode.Unknown:
        return StripeFailure('There Was An Error, Please Try Again');
    }
  }
}

class CanceledFailure extends StripeFailure {
  CanceledFailure() : super('Request Was Canceled');
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate With ApiServer');
      case DioExceptionType.cancel:
        return ServerFailure('Request To ApiServer Was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('There Was An Error, Please Try Again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!);
    }
  }

  factory ServerFailure.fromResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(response.data['error']['message']);
      case 404: //not found
        return ServerFailure(
          'Your Request Was Not Found, Please Try Again Later',
        );
      case 500: // Server exception
        return ServerFailure(
          'There Is A Problem With Server. Please Try Again Later',
        );
      default:
        return ServerFailure(
          'There Was An Error With BadResponse, Please Try Again',
        );
    }
  }
}
