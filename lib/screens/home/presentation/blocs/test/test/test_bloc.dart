import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_bloc.freezed.dart';
part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(const TestState.initial()) {
    on<TestEvent>((events, emit) async {
      await events.when(
        initialEvent: () {},
        loading: () {},
      );
    });
  }
}
