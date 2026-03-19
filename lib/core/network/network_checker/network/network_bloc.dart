import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'network_bloc.freezed.dart';
part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final InternetConnection _checker;
  StreamSubscription<InternetStatus>? _subscription;

  NetworkBloc(this._checker) : super(const NetworkState.initial()) {
    // Register ONE handler for the base NetworkEvent
    on<NetworkEvent>((event, emit) {
      // Use Freezed's .when() to cleanly route the logic
      event.when(
        started: () {
          _subscription?.cancel();
          _subscription = _checker.onStatusChange.listen((status) {
            add(NetworkEvent.statusChanged(status));
          });
        },
        statusChanged: (status) {
          if (status == InternetStatus.connected) {
            emit(const NetworkState.connected());
          } else {
            emit(const NetworkState.disconnected());
          }
        },
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
