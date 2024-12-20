// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      statusCode: (json['error_code'] as num).toInt(),
      apiErrorMessage: json['description'] as String,
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'error_code': instance.statusCode,
      'description': instance.apiErrorMessage,
    };
