import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/models/response/comment_response.dart';

abstract class CommentRepository{
  ResultFuture<List<CommentResponse>> getComments(int postId);
}