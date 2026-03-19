part of 'network_bloc.dart';

@freezed
class NetworkEvent with _$NetworkEvent {
  // Triggers the Bloc to start listening to the internet stream
  const factory NetworkEvent.started() = _Started;

  // Fired internally by the stream whenever the connection drops or returns
  const factory NetworkEvent.statusChanged(InternetStatus status) =
      _StatusChanged;
}
