part of 'comment_bloc.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState.initial() = _Initial;
  const factory CommentState.loadInProgress() = _LoadInProgress;
}