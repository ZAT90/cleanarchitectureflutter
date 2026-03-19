part of 'test_bloc.dart';

@freezed
class TestState with _$TestState {
  const factory TestState.initial() = _Initial;
  const factory TestState.loadInProgress() = _LoadInProgress;
}