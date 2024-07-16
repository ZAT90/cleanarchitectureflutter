import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/repositories/comment_repo.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/models/response/comment_response.dart';

class GetCommentsUseCase {
  final CommentRepository commentRepository;
  GetCommentsUseCase(this.commentRepository);
  ResultFuture<List<CommentResponse>> getComments(int postId) async =>
      await commentRepository.getComments(postId);
}
