part of 'comment_bloc.dart';

@freezed
class CommentEvent with _$CommentEvent {
   const factory CommentEvent.loadComments(PostResponse? post) = _LoadComments;
}