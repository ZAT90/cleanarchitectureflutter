part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
// Example: If you need to show a SnackBar when a user deletes a post
  const factory HomeState.actionSuccess(String message) = _ActionSuccess;

  // Example: If a non-pagination API call fails
  const factory HomeState.actionFailure(String error) = _ActionFailure;
}
