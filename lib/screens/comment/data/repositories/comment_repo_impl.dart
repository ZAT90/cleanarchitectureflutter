import 'package:cleanarchitectureflutter/core/utils/error/api_error_message.dart';
import 'package:cleanarchitectureflutter/core/utils/type_defs.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/data_sources/comment_remote_data_source.dart';
import 'package:cleanarchitectureflutter/screens/comment/data/models/response/comment_response.dart';
import 'package:cleanarchitectureflutter/screens/comment/domain/repositories/comment_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CommentRepository)
class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource commentRemoteDataSource;
  CommentRepositoryImpl(this.commentRemoteDataSource);
  @override
  ResultFuture<List<CommentResponse>> getComments(int postId) async {
    try {
      return Success(await commentRemoteDataSource.getComments(postId));
    } on ApiErrorMessage catch (e) {
      // 3. Catch the specific error thrown by .getOrThrow()
      return Failure(e);
    } catch (e) {
      // 4. Catch any other unexpected errors (like mapping crashes)
      return Failure(ApiErrorMessage(errorMessage: e.toString()));
    }
  }
}
