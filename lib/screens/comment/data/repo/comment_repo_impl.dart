import 'package:cleanarchitectureflutter/screens/comment/data/data_source/comment_remote_data_source.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/repo/comment_repo.dart';
import 'package:cleanarchitectureflutter/screens/comment/models/response/comment_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CommentRepository)
class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource commentRemoteDataSource;
  CommentRepositoryImpl(this.commentRemoteDataSource);
  @override
  Future<List<CommentResponse>> getComments(int postId) async {
    return await commentRemoteDataSource.getComments(postId);
  }
}
