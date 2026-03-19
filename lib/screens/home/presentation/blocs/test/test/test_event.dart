part of 'test_bloc.dart';

@freezed
class TestEvent with _$TestEvent {
  const factory TestEvent.initialEvent() = _InitialEvent;
  const factory TestEvent.loading() = _LoadIng;
}
