// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refreshList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refreshList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refreshList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RefreshList value) refreshList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RefreshList value)? refreshList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RefreshList value)? refreshList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RefreshListImplCopyWith<$Res> {
  factory _$$RefreshListImplCopyWith(
          _$RefreshListImpl value, $Res Function(_$RefreshListImpl) then) =
      __$$RefreshListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshListImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$RefreshListImpl>
    implements _$$RefreshListImplCopyWith<$Res> {
  __$$RefreshListImplCopyWithImpl(
      _$RefreshListImpl _value, $Res Function(_$RefreshListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshListImpl implements _RefreshList {
  const _$RefreshListImpl();

  @override
  String toString() {
    return 'HomeEvent.refreshList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refreshList,
  }) {
    return refreshList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refreshList,
  }) {
    return refreshList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refreshList,
    required TResult orElse(),
  }) {
    if (refreshList != null) {
      return refreshList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RefreshList value) refreshList,
  }) {
    return refreshList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RefreshList value)? refreshList,
  }) {
    return refreshList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RefreshList value)? refreshList,
    required TResult orElse(),
  }) {
    if (refreshList != null) {
      return refreshList(this);
    }
    return orElse();
  }
}

abstract class _RefreshList implements HomeEvent {
  const factory _RefreshList() = _$RefreshListImpl;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String error) actionFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String error)? actionFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? actionSuccess,
    TResult Function(String error)? actionFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_ActionFailure value) actionFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_ActionFailure value)? actionFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_ActionFailure value)? actionFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String error) actionFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String error)? actionFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? actionSuccess,
    TResult Function(String error)? actionFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_ActionFailure value) actionFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_ActionFailure value)? actionFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_ActionFailure value)? actionFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ActionSuccessImplCopyWith<$Res> {
  factory _$$ActionSuccessImplCopyWith(
          _$ActionSuccessImpl value, $Res Function(_$ActionSuccessImpl) then) =
      __$$ActionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ActionSuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ActionSuccessImpl>
    implements _$$ActionSuccessImplCopyWith<$Res> {
  __$$ActionSuccessImplCopyWithImpl(
      _$ActionSuccessImpl _value, $Res Function(_$ActionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ActionSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActionSuccessImpl implements _ActionSuccess {
  const _$ActionSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.actionSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionSuccessImplCopyWith<_$ActionSuccessImpl> get copyWith =>
      __$$ActionSuccessImplCopyWithImpl<_$ActionSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String error) actionFailure,
  }) {
    return actionSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String error)? actionFailure,
  }) {
    return actionSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? actionSuccess,
    TResult Function(String error)? actionFailure,
    required TResult orElse(),
  }) {
    if (actionSuccess != null) {
      return actionSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_ActionFailure value) actionFailure,
  }) {
    return actionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_ActionFailure value)? actionFailure,
  }) {
    return actionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_ActionFailure value)? actionFailure,
    required TResult orElse(),
  }) {
    if (actionSuccess != null) {
      return actionSuccess(this);
    }
    return orElse();
  }
}

abstract class _ActionSuccess implements HomeState {
  const factory _ActionSuccess(final String message) = _$ActionSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ActionSuccessImplCopyWith<_$ActionSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActionFailureImplCopyWith<$Res> {
  factory _$$ActionFailureImplCopyWith(
          _$ActionFailureImpl value, $Res Function(_$ActionFailureImpl) then) =
      __$$ActionFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ActionFailureImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ActionFailureImpl>
    implements _$$ActionFailureImplCopyWith<$Res> {
  __$$ActionFailureImplCopyWithImpl(
      _$ActionFailureImpl _value, $Res Function(_$ActionFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ActionFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActionFailureImpl implements _ActionFailure {
  const _$ActionFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'HomeState.actionFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionFailureImplCopyWith<_$ActionFailureImpl> get copyWith =>
      __$$ActionFailureImplCopyWithImpl<_$ActionFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String error) actionFailure,
  }) {
    return actionFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String error)? actionFailure,
  }) {
    return actionFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? actionSuccess,
    TResult Function(String error)? actionFailure,
    required TResult orElse(),
  }) {
    if (actionFailure != null) {
      return actionFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_ActionFailure value) actionFailure,
  }) {
    return actionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_ActionFailure value)? actionFailure,
  }) {
    return actionFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_ActionFailure value)? actionFailure,
    required TResult orElse(),
  }) {
    if (actionFailure != null) {
      return actionFailure(this);
    }
    return orElse();
  }
}

abstract class _ActionFailure implements HomeState {
  const factory _ActionFailure(final String error) = _$ActionFailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ActionFailureImplCopyWith<_$ActionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
