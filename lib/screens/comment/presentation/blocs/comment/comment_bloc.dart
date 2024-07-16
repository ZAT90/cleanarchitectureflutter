import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/repositories/comment_repo.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/usecases/get_comments_usecase.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/models/response/comment_response.dart';
import 'package:cleanarchitectureflutter/screens/home/data/models/response/post_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.dart';
part 'comment_event.dart';
part 'comment_bloc.freezed.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetCommentsUseCase getCommentsUseCase;
  CommentBloc(this.getCommentsUseCase) : super(const CommentState.initial()) {
    on<CommentEvent>((events, emit) async {
      await events.when(loadComments: (PostResponse? post) async {
        final commentsResponse =
            await getCommentsUseCase.getComments(post!.id!);
        logger.d('comment event called: $commentsResponse');
        commentsResponse.fold(
          (error) => logger.d('error comments: $error'),
          (comments) => emit(
              CommentState.getCommentsAndPost(post: post, comments: comments)),
        );
        //emit(CommentState.getCommentsAndPost(post: post, comments: comments));
      });
    });
  }
}
