import 'package:telelog/src/data/errors/core_errors.dart';
import 'package:telelog/src/data/errors/custom_error.dart';

part 'api_error.g.dart';

class ApiError {
  final int statusCode;
  final String apiErrorMessage;

  ApiError({
    required this.statusCode,
    required this.apiErrorMessage,
  });

  factory ApiError.fromJson(final Map<String, dynamic> data) =>
      _$ApiErrorFromJson(data);

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
