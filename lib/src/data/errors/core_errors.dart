import 'package:telelog/src/data/errors/custom_error.dart';

class InternetConnectionError extends CustomError {
  InternetConnectionError()
      : super(
          errorMessage: 'You dont have internet connection',
        );
}

class SomethingWentWrongError extends CustomError {
  SomethingWentWrongError()
      : super(
          errorMessage: 'Something went wrong , please try again later',
        );
}

class ServerError extends CustomError {
  ServerError()
      : super(
          errorMessage: 'The server is down',
        );
}

class ForbiddenError extends CustomError {
  ForbiddenError()
      : super(
          errorMessage: 'You are not allowed to perform this action',
        );
}

class NotFoundError extends CustomError {
  NotFoundError({required super.errorMessage}) : super();
}

class BadRequestError extends CustomError {
  BadRequestError({required super.errorMessage}) : super();
}

class UnProcessableEntityError extends CustomError {
  UnProcessableEntityError({required super.errorMessage});
}

class UnAuthorizedError extends CustomError {
  UnAuthorizedError()
      : super(
          errorMessage: 'Unauthorized',
        );
}
