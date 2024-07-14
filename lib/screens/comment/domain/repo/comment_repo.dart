import 'package:cleanarchitectureflutter/screens/comment/models/response/comment_response.dart';

abstract class CommentRepository {
  Future<List<CommentResponse>> getComments(int postId);
}
