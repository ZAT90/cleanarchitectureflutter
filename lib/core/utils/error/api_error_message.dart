import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_message.freezed.dart';
part 'api_error_message.g.dart';

@freezed
class ApiErrorMessage with _$ApiErrorMessage {
    const factory ApiErrorMessage({
        String? errorMessage,
    }) = _ApiErrorMessage;

    factory ApiErrorMessage.fromJson(Map<String, dynamic> json) => _$ApiErrorMessageFromJson(json);
}
