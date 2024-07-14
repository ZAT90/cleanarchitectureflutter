import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/repo/comment_repo.dart';
import 'package:cleanarchitectureflutter/screens/comment/models/response/comment_response.dart';
import 'package:cleanarchitectureflutter/screens/home/models/response/post_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.dart';
part 'comment_event.dart';
part 'comment_bloc.freezed.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;
  CommentBloc(this.commentRepository) : super(const CommentState.initial()) {
    on<CommentEvent>((events, emit) async {
      await events.when(loadComments: (PostResponse? post) async {
        final comments = await commentRepository.getComments(post!.id!);
        logger.d('comment event called: $comments');
        emit(CommentState.getCommentsAndPost(post: post, comments: comments));
      });
    });
  }
}
