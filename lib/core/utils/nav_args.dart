import 'package:cleanarchitectureflutter/screens/comment/models/response/comment_response.dart';
import 'package:cleanarchitectureflutter/screens/home/models/response/post_response.dart';

class CommentNavArgs {
  const CommentNavArgs({required this.post});
  final PostResponse post;
}