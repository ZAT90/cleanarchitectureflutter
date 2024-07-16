import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_response.freezed.dart';
part 'comment_response.g.dart';

@freezed
class CommentResponse with _$CommentResponse {
    const factory CommentResponse({
        int? postId,
        int? id,
        String? name,
        String? email,
        String? body,
    }) = _CommentResponse;

    factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);
}
