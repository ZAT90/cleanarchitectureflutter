part of 'network_bloc.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState.initial() = _Initial;
  const factory NetworkState.connected() = _Connected;
  const factory NetworkState.disconnected() = _Disconnected;
}
