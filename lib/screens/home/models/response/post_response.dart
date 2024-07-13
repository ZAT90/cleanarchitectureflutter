import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_response.freezed.dart';
part 'post_response.g.dart';

@freezed
class PostResponse with _$PostResponse {
    const factory PostResponse({
        int? userId,
        int? id,
        String? title,
        String? body,
    }) = _PostResponse;

    factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);
}