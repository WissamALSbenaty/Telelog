import 'package:telelog/src/data/errors/core_errors.dart';
import 'package:telelog/src/data/errors/custom_error.dart';

class ApiError {
  final int statusCode;
  final String apiErrorMessage;

  ApiError({
    required this.statusCode,
    required this.apiErrorMessage,
  });

  factory ApiError.fromJson(final Map<String, dynamic> data) => ApiError(
        statusCode: (data['error_code'] as num).toInt(),
        apiErrorMessage: data['description'] as String,
      );

  CustomError get customError {
    return statusCode == 400
        ? BadRequestError(errorMessage: apiErrorMessage)
        : statusCode == 401
            ? UnAuthorizedError()
            : statusCode == 403
                ? ForbiddenError()
                : statusCode == 404
                    ? NotFoundError(errorMessage: apiErrorMessage)
                    : statusCode == 422
                        ? UnProcessableEntityError(
                            errorMessage: apiErrorMessage)
                        : ServerError();
  }
}
