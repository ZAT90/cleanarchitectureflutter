// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiErrorMessage _$ApiErrorMessageFromJson(Map<String, dynamic> json) {
  return _ApiErrorMessage.fromJson(json);
}

/// @nodoc
mixin _$ApiErrorMessage {
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiErrorMessageCopyWith<ApiErrorMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorMessageCopyWith<$Res> {
  factory $ApiErrorMessageCopyWith(
          ApiErrorMessage value, $Res Function(ApiErrorMessage) then) =
      _$ApiErrorMessageCopyWithImpl<$Res, ApiErrorMessage>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class _$ApiErrorMessageCopyWithImpl<$Res, $Val extends ApiErrorMessage>
    implements $ApiErrorMessageCopyWith<$Res> {
  _$ApiErrorMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiErrorMessageImplCopyWith<$Res>
    implements $ApiErrorMessageCopyWith<$Res> {
  factory _$$ApiErrorMessageImplCopyWith(_$ApiErrorMessageImpl value,
          $Res Function(_$ApiErrorMessageImpl) then) =
      __$$ApiErrorMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$ApiErrorMessageImplCopyWithImpl<$Res>
    extends _$ApiErrorMessageCopyWithImpl<$Res, _$ApiErrorMessageImpl>
    implements _$$ApiErrorMessageImplCopyWith<$Res> {
  __$$ApiErrorMessageImplCopyWithImpl(
      _$ApiErrorMessageImpl _value, $Res Function(_$ApiErrorMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$ApiErrorMessageImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorMessageImpl implements _ApiErrorMessage {
  const _$ApiErrorMessageImpl({this.errorMessage});

  factory _$ApiErrorMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorMessageImplFromJson(json);

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ApiErrorMessage(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorMessageImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorMessageImplCopyWith<_$ApiErrorMessageImpl> get copyWith =>
      __$$ApiErrorMessageImplCopyWithImpl<_$ApiErrorMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorMessageImplToJson(
      this,
    );
  }
}

abstract class _ApiErrorMessage implements ApiErrorMessage {
  const factory _ApiErrorMessage({final String? errorMessage}) =
      _$ApiErrorMessageImpl;

  factory _ApiErrorMessage.fromJson(Map<String, dynamic> json) =
      _$ApiErrorMessageImpl.fromJson;

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ApiErrorMessageImplCopyWith<_$ApiErrorMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
